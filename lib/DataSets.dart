class DataSets {
  var mensalExpenses = {
    '2024': [
      {
        'month': 'jan',
        'totalExpended': '520.1',
        'costs': [
          {
            'id': 0,
            'title': 'AppleTV+',
            'subtitle': 'Plan Plus',
            'icon': 'abc_outlined',
            'cost': '9.99',
            'date': 'Sep,14',
          },
          {
            'id': 1,
            'title': 'Disney+',
            'subtitle': 'Plan Plus',
            'icon': 'abc_outlined',
            'cost': '19.99',
            'date': 'Jan,12',
          },
          {
            'id': 2,
            'title': 'Netflix',
            'subtitle': 'Plan Plus',
            'icon': 'abc_outlined',
            'cost': '39.99',
            'date': 'Jan,1',
          }
        ]
      },
      {
        'month': 'feb',
        'totalExpended': '120.1',
        'costs': [
          {
            'id': 3,
            'title': 'Conta 2',
            'subtitle': 'plano 2',
            'icon': 'ac_unit_sharp',
            'cost': '2.22',
            'date': 'Jan,1',
          }
        ]
      },
      {
        'month': 'mar',
        'totalExpended': '71',
        'costs': [
          {
            'id': 4,
            'title': 'New Wallet',
            'subtitle': 'Unique price',
            'icon': 'account_balance_wallet_rounded',
            'cost': '49.44',
            'date': 'Feb,25',
          }
        ]
      },
      {
        'month': 'apr',
        'totalExpended': '1000',
        'costs': [
          {
            'id': 5,
            'title': 'Carnival',
            'subtitle': 'Anual plan',
            'icon': 'wysiwyg_outlined',
            'cost': '150.89',
            'date': 'Apr,12',
          }
        ]
      },
      {
        'month': 'may',
        'totalExpended': '520.1',
        'costs': [
          {
            'id': 6,
            'title': 'Carnival',
            'subtitle': 'Anual plan',
            'icon': 'wysiwyg_outlined',
            'cost': '150.89',
            'date': 'Apr,12',
          }
        ]
      },
    ],
    '2025': [
      {
        'Jan': [
          {
            'totalExpended': '520.1',
            'costs': [
              {
                'id': 6,
                'title': '',
                'subtitle': '',
                'icon': '',
                'cost': '',
                'date': '',
              }
            ]
          }
        ],
        'Feb': [
          {
            'totalExpended': '520.1',
            'costs': [
              {
                'title': '',
                'subtitle': '',
                'icon': '',
                'cost': '',
                'date': '',
              }
            ]
          }
        ],
        'Mar': [
          {
            'totalExpended': '520.1',
            'costs': [
              {
                'title': '',
                'subtitle': '',
                'icon': '',
                'cost': '',
                'date': '',
              }
            ]
          }
        ],
        'Apr': [
          {
            'totalExpended': '520.1',
            'costs': [
              {
                'title': '',
                'subtitle': '',
                'icon': '',
                'cost': '',
                'date': '',
              }
            ]
          }
        ],
      }
    ],
  };
  var paymenTypes = {
    [{
        "id": 0,
        "name": "One-time",
        "icon-name": "payments",
        "value": "ONE-TIME"},
      {"id": 1, "name": "Weekly", "icon-name": "payments", "value": "WEEKLY"},
      {"id": 2, "name": "Monthly", "icon-name": "payments", "value": "MONTHLY"},
      {"id": 3, "name": "Yearly", "icon-name": "payments", "value": "YEARLY"}
    ]
  };
  var id = {
    "name": "Netflix",
    "first-payment": 'Feb,18',
    "repeat": {"active": true, "frequency": "WEEKLY"},
    "payment-method": "Credit Card",
    "img-url": "./assets/netF.png",
  };
}
