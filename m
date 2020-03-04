Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39428178A8E
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 07:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tbcuDfYaDl0s2pOUxHvvOkfOWHYsJpebfP0ObmyJLhA=; b=DjNRtTSwQWe0vEhPBGcWIFPZoH
	NmKdqoPFqAsSfuexhcjU+bzdRwqk4jCaNZ/dvGqJ7l5QRltMyZ2RarJY2aQfwiY17AVkojB4PpVL8
	/eVKIlm8yOuteJO1vkUtCfqw1mQR2mUzBL3R7Zn71tUfCaUSYRGXwCTo59eA3mtTfuEVixcDLvpQ/
	bKgMA3Ivxr6gqdpDu6KPihs8w2laFlt69UwOmueeSqDG+/92paztOlx4r8oGhZoWmgnOnRCLe7VMQ
	CATwRXdcqagOu3hQkMfYCt4C6q9T2tSb3co6XCMWjJQaFjFKgRbUhqcGppr4tadfVhyVGhLtRxmEw
	b20poZhA==;
Received: from localhost ([::1]:65062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9NRO-00ErmG-DN; Wed, 04 Mar 2020 06:23:34 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:34620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9NRJ-00Erm8-6j
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 06:23:31 +0000
Received: by mail-yw1-xc43.google.com with SMTP id o186so1012486ywc.1
 for <samba-technical@lists.samba.org>; Tue, 03 Mar 2020 22:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbcuDfYaDl0s2pOUxHvvOkfOWHYsJpebfP0ObmyJLhA=;
 b=pnUUEvB3emIIYIR+4DE+c2kjKv/n3JDAttQZl/Z8rY5peVO84IFZ7XMRFn9sGz13ki
 7xYAbcCnds8+jE3Az1o6tS6Vm0utLaCW75ICVgGZ36fvpIW5pNm4AhSJONxVtqsMlhQ8
 tJNldWnRN0W9DXGj6W9iGcdmxomrCXhDZGwPgyezJSieiMeBjiVcstmnvKXulRAZssbP
 g6lqxXdV6UB42snjshIGMEvZF/8PUKHp1iQi71wp2TNfyJxRXDZSlyyOZFv8kvSe+hSV
 fORT4Wbocws1DsnD1VTADO3nTJX4Rrpndhhm5qtsli8VqT35VW9LbRPAC6+kFYnx+51p
 E96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbcuDfYaDl0s2pOUxHvvOkfOWHYsJpebfP0ObmyJLhA=;
 b=TYp4k5VanMvh2M3+Z568YBHAGXiv9JbgjPNRhvz12ByKIj8sbfc3SnmzdkDOpct4bd
 V1VtOkBdxIpRSFjyRleLuu6NUrGRuVQ0xOSh3horpqz2C8+mwow77+BZIrPwSaUKgYsx
 E3tj/aZ+0GjzbxGpak3DjangtVcl3wgcxcFwbiPw3ETHWTI8ZtJSi+N4QWJY3XHrjdHJ
 TaF0mmEBP9DP44U7X6ES1oXd1hmhnWzx3650Wiynsui//QgSYWlKOB3KEt1G3jw6mHlG
 6gwAggDmArqOB22KTfSdRymEp6+hMzRCe9RYKZvA7nyjaH5PtL80I/O0XvAc//6YjqAN
 xDKQ==
X-Gm-Message-State: ANhLgQ3ftVYfj1sEU+xgC5urTkxhHAXiA1c5+xa6fHsfLQ6sIPnJD8uU
 /rH+T8G9xkh7mzmyF1imUNSPhScEIidmqHrBKmY=
X-Google-Smtp-Source: ADFU+vtJJiFniW/eKxBD4MR+qeAqmZ5k8NJak28YOj5w+Lndf/ByC4XUp8y8n7q9Pqhtb5af3SjTW245SjErulbzu/Q=
X-Received: by 2002:a81:4cc2:: with SMTP id z185mr1475074ywa.357.1583303007222; 
 Tue, 03 Mar 2020 22:23:27 -0800 (PST)
MIME-Version: 1.0
References: <1583278783-11584-1-git-send-email-hqjagain@gmail.com>
In-Reply-To: <1583278783-11584-1-git-send-email-hqjagain@gmail.com>
Date: Wed, 4 Mar 2020 00:23:16 -0600
Message-ID: <CAH2r5mv9N_vo+vX7TaaPc2MBNFgsOAO6nGZcfaiaz8JqjM0BnQ@mail.gmail.com>
Subject: Re: [PATCH] fs/cifs/cifsacl: remove set but not used variable 'rc'
To: Qiujun Huang <hqjagain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Isn't it not used because of a potential bug - missing returning an
error in two cases.

If we leave the two lines you removed in - and set rc=0 in its
declaration (and return rc at the end as you originally had suggested)
- doesn't that solve the problem?  A minor modification to your first
proposed patch?

On Tue, Mar 3, 2020 at 5:39 PM Qiujun Huang <hqjagain@gmail.com> wrote:
>
>  It is set but not used, So can be removed.
>
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>  fs/cifs/cifsacl.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> index 716574a..1cf3916 100644
> --- a/fs/cifs/cifsacl.c
> +++ b/fs/cifs/cifsacl.c
> @@ -342,7 +342,6 @@
>  sid_to_id(struct cifs_sb_info *cifs_sb, struct cifs_sid *psid,
>                 struct cifs_fattr *fattr, uint sidtype)
>  {
> -       int rc;
>         struct key *sidkey;
>         char *sidstr;
>         const struct cred *saved_cred;
> @@ -403,7 +402,6 @@
>         saved_cred = override_creds(root_cred);
>         sidkey = request_key(&cifs_idmap_key_type, sidstr, "");
>         if (IS_ERR(sidkey)) {
> -               rc = -EINVAL;
>                 cifs_dbg(FYI, "%s: Can't map SID %s to a %cid\n",
>                          __func__, sidstr, sidtype == SIDOWNER ? 'u' : 'g');
>                 goto out_revert_creds;
> @@ -416,7 +414,6 @@
>          */
>         BUILD_BUG_ON(sizeof(uid_t) != sizeof(gid_t));
>         if (sidkey->datalen != sizeof(uid_t)) {
> -               rc = -EIO;
>                 cifs_dbg(FYI, "%s: Downcall contained malformed key (datalen=%hu)\n",
>                          __func__, sidkey->datalen);
>                 key_invalidate(sidkey);
> --
> 1.8.3.1
>


-- 
Thanks,

Steve

