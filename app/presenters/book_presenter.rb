class BookPresenter < BasePresenter
  COLUMNS = [
    { name: :id,     label: 'ID'     },
    { name: :title,  label: 'Title'  },
    { name: :body,   label: 'Body'   },
    { name: :author, label: 'Author' }
  ]

  def columns
    COLUMNS
  end

  def columns_keys
    COLUMNS.map { |column| column[:name] }
  end

  def actions
    [
      { name: :edit, label: 'Edit' },
      { name: :delete, label: 'Delete' }
    ]
  end

  def meta
    {
      columns: columns,
      columns_keys: columns_keys,
      actions: actions
    }
  end
end
