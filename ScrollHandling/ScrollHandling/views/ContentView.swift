//
//  ContentView.swift
//  ScrollHandling
//
//  Created by Ahmed Shaban on 04/10/2024.
//

import SwiftUI


struct MenuListView: View {
    
    @StateObject var vm = DummyViewModel()
    
    @State private var selectedCategory: Int = 0
    @State private var isPopupPresented = false
    @State private var productToPop: Int = 0
    
    @State private var lastScrollPosition: CGFloat = 0
    @State private var showHeader: Bool = true
    @State private var dragOffset: CGFloat = 0
    @State private var previousOffset: CGFloat = 0
    @State private var isScrollingUp: Bool = false
    
    @State private var primaryYOffset: CGFloat?
    @State private var secondaryYOffset: CGFloat?
    @State private var categoryTapped: Bool = false
    
    @Namespace var nameSpace
    
    var body: some View {
        VStack {
            VStack {
                if showHeader {
                    normalHeader
                } else {
                    collapsedHeader
                }

            }
            .animation(.easeInOut, value: showHeader)

            categorisTabs
            productsList
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white)
        )
        .padding(.top, 12)
        .onAppear {
            selectedCategory = vm.categories.first?.id ?? 0
        }
    }
    private var collapsedHeader: some View {
        HStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .padding(.top, 5)
                .matchedGeometryEffect(id: "brandLogo", in: nameSpace)


            Text("Dummy Restaurant")
                .matchedGeometryEffect(id: "brandName", in: nameSpace)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 5)

        }
    }

    private var normalHeader: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
                .matchedGeometryEffect(id: "brandLogo", in: nameSpace)


            
            Text("Dummy Restaurant")
                .matchedGeometryEffect(id: "brandName", in: nameSpace)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
        }
    }
    // Category tabs
    private var categorisTabs: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    ForEach(vm.categories, id: \.self) { category in
                        Button(action: {
                            categoryTapped = true
                            selectedCategory = category.id
                        }) {
                            Text(category.name)
                                .foregroundColor(selectedCategory == category.id ? .white : .gray)
                                .padding(.horizontal, 3)
                                .frame(maxWidth: .infinity)
                        }
                        .id(category.id)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(selectedCategory == category.id ? Color.red : Color.green)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .font(.headline)
                    }
                    Spacer()
                }
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
            }
            .onChange(of: selectedCategory) { old, newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        proxy.scrollTo(newValue, anchor: .leading)
                    }
                }
            }
        }
    }

    // Products list
    private var productsList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    GeometryReader { geometry in
                        let yOffset = geometry.frame(in: .global).minY
                        Color.clear
                            .onAppear {
                                primaryYOffset = yOffset
                            }
                            .onChange(of: yOffset) {
                                handleHeaderPresentation(newValue: yOffset, geometry: geometry)
                            }
                    }
                    .frame(height: 0)
                    
                    LazyVStack {
                        ForEach(vm.categories.sorted(by: { $0.id < $1.id }), id: \.id) { category in
                            categoryView(category: category)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .onChange(of: selectedCategory) {
                    if categoryTapped {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                proxy.scrollTo(selectedCategory, anchor: .top)
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                categoryTapped.toggle()
                        }
                    }
                }
            }
        }
    }
    
    // Category view
    private func categoryView(category: DummyCategory) -> some View {
        Section(header: Text(category.name)
            .id(category.id)
            .font(.title2)
            .padding()
            .foregroundColor(.red)) {
                categoryMeals(category: category)
            }
            .onCategoryAppear(targetY: UIScreen.main.bounds.height / 2) { isVisible in
                if isVisible && !categoryTapped {
                    selectedCategory = category.id
                }
            }
    }
    
    // Products in each category
    private func categoryMeals(category: DummyCategory) -> some View {
        ForEach(category.products, id: \.id) { product in
            MenuItemCellView(product: product, vm: vm)
        }
    }
    
    private func handleHeaderPresentation(newValue: CGFloat, geometry: GeometryProxy) {
        if showHeader {
            if let primaryYOffset {
                if newValue < primaryYOffset - 400  {
                    withAnimation {
                        showHeader = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        secondaryYOffset = geometry.frame(in: .global).minY
                    }
                }
            }
        } else {
            if let secondaryYOffset {
                if newValue > secondaryYOffset + 100 {
                    withAnimation {
                        showHeader = true
                    }
                }
            }
        }
    }
}


extension View {
    func onCategoryAppear(targetY: CGFloat, action: @escaping (Bool) -> Void) -> some View {
        self.background(
            GeometryReader { geo in
                Color.clear
                    .onChange(of: geo.frame(in: .global).midY) { old, yPosition in
                        let targetArea = (targetY - 100)...(targetY + 100)
                        action(targetArea.contains(yPosition))
                    }
            }
        )
    }
}
