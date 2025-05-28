# GitBook → GitHub → Local → GitBook Sync Workflow

This guide will help you set up a complete workflow to sync GitBook content with GitHub, modify it locally using this assistant, and sync changes back to GitBook.

## Overview of the Workflow

1. **GitBook** → **GitHub** (Initial sync)
2. **GitHub** → **Local** (Clone repository) 
3. **Local modifications** (Using this assistant)
4. **Local** → **GitHub** (Push changes)
5. **GitHub** → **GitBook** (Automatic sync)

## Prerequisites

- GitBook account with a space/documentation
- GitHub account
- Git installed on your system
- Access to this workspace

## Step 1: Set up GitBook GitHub Sync

### In GitBook:

1. Go to your GitBook space
2. Click **Configure** in the top-right corner
3. Select **GitHub Sync** from the provider list
4. Authenticate with GitHub if prompted
5. Install the GitBook app to your GitHub account
6. Select the repository and branch you want to sync with
7. Choose initial sync direction:
   - **GitBook → GitHub**: Start with GitBook content (recommended for existing GitBook docs)
   - **GitHub → GitBook**: Start with GitHub content (if you have existing markdown)

### Important Notes:
- Live edits will be locked in GitBook once sync is enabled
- Changes in GitBook create commits in GitHub
- Commits in GitHub sync to GitBook as history commits

## Step 2: Clone Repository Locally

Once GitBook-GitHub sync is set up, we'll clone the repository to this workspace.

## Step 3: Local Modification Workflow

With the repository cloned locally, you can:

1. **Edit files** using this assistant
2. **Create new content** in Markdown format
3. **Organize documentation** structure
4. **Preview changes** before pushing

## Step 4: Sync Back to GitBook

The workflow for syncing changes back:

1. **Commit changes** locally
2. **Push to GitHub** 
3. **Automatic sync** to GitBook (via GitHub Sync)

## File Structure

GitBook syncs use this structure:
```
your-repo/
├── README.md              # Main page
├── SUMMARY.md            # Table of contents
├── .gitbook.yaml         # GitBook configuration
├── chapter1/
│   ├── README.md
│   └── page1.md
└── chapter2/
    ├── README.md
    └── page2.md
```

## GitBook Configuration File

The `.gitbook.yaml` file controls how GitBook interprets your repository:

```yaml
root: ./

structure:
  readme: README.md
  summary: SUMMARY.md

redirects:
  previous/page: new/page.md
```

## Best Practices

1. **Always use branches** for major changes
2. **Test locally** before pushing to main branch
3. **Use descriptive commit messages** for better GitBook history
4. **Keep SUMMARY.md updated** for navigation
5. **Follow Markdown best practices** for GitBook compatibility

## Common GitBook Markdown Extensions

GitBook supports special blocks:

### Hints
```markdown
{% hint style="info" %}
This is an info hint
{% endhint %}
```

### Code blocks with tabs
```markdown
{% tabs %}
{% tab title="JavaScript" %}
```javascript
console.log("Hello World");
```
{% endtab %}

{% tab title="Python" %}
```python
print("Hello World")
```
{% endtab %}
{% endtabs %}
```

### Page references
```markdown
{% page-ref page="path/to/page.md" %}
```

## Troubleshooting

### Sync Issues
- Check repository permissions in GitHub
- Verify GitBook app installation
- Ensure branch names match configuration

### Formatting Issues
- GitBook prefers certain Markdown formatting
- Test complex layouts in GitBook before finalizing
- Use GitBook's native blocks for best results

## Next Steps

After reading this guide:
1. Set up GitBook-GitHub sync (if not done already)
2. Provide your GitHub repository URL to clone it here
3. Start making modifications using this assistant
4. Push changes and verify sync with GitBook

---

*This workflow enables seamless collaboration between technical writers using GitBook's editor and developers/content creators working in code editors.* 