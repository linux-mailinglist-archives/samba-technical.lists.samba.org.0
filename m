Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B53AC1CD
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jun 2021 06:10:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Jq4B3avybY4XSJGB+m+7/MptGTh/l5uH9dNGzWIr4yg=; b=NYp5naF6qi+yHAOtZMkrERZqn2
	DO5cGcaXsc/e84A6e8TytJMpF7dR5DCq1agB4rrlFFSiYjfJWzv9Ds/gxFZhfF4yq6sj5V/SQYyx+
	HNNqrwPom0BLmbUdYQGqATEI/KB5h/HBk8nKLDzfnBvnHkor/bHVwu6Mg/l9wJ2u57EFiszIGPoDM
	SQZCErvyIQ7dP19sANtTCP0HtmmKIbUt/ITrMrONMVdjAaDErf/xpzk3MrsOyhZQl7rbAM4HZYTA4
	FBG3l60DTb9U573fgNilJeGCwtcSfQPaFsRPITRCQJXr/5sc7p7UxWmGWa9OEC122zoEsNM0r9L74
	OBtMjb0Q==;
Received: from ip6-localhost ([::1]:41046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lu5ok-006hld-98; Fri, 18 Jun 2021 04:09:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:46822) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lu5oe-006hlU-Uh
 for samba-technical@lists.samba.org; Fri, 18 Jun 2021 04:09:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id m21so14145177lfg.13
 for <samba-technical@lists.samba.org>; Thu, 17 Jun 2021 21:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jq4B3avybY4XSJGB+m+7/MptGTh/l5uH9dNGzWIr4yg=;
 b=jcWa7DBTrJ0TdVGBWFgGBZYAbXYh0sUIYIcRYFtab3oEWf65kyQ5XamN058Jb6UTvb
 igcQaSB+lSA5rZxMYN81aERwk5gZebZgsBGJdEUiX6qEXiXV6HMxROEPZzGP3HdhGdei
 rLuNhkPF9/xOZPGWOnnmFNf2lsVuKXfmJsB3XLWn7XlRsYzVkLQq+QufiTwiwnA0KLl8
 3AQe+f6AzsNOQKAqd/wmils9VZkN4cxA0Zq53t5Z9cJGR/HaQGqvDMTsEULhSQU878Q4
 DZ8WAAY4lJ+k5F+6EZ2cSqBVCc1R06iXJUAANpHFLxUdaUQvGPmwO1vs4CDiYTZoEjYH
 moKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jq4B3avybY4XSJGB+m+7/MptGTh/l5uH9dNGzWIr4yg=;
 b=cr9KOSUgnY65Qv+txWChje8SrK5SZOVWOMceDHJMXs5KORr0ZPrWJ2pIPm8AwDsrj+
 6wbk8CTmaAVHtONwcCokUWhJt+bVDIHjSPO6QtdYRep/c8QCPRpD7fPw6MCUTajN0JXi
 zHUnPoYd4BzgiOCOAm7ddUUvJGn+rbHQ33q418z8GPI2z+FGL2UtlmwKj1HxPOjolmhs
 JKmdhtfotxuJzL5p6fMiNZMga16p48iUDRyDvvNYC6O5YBb0W+H9K8tA9LitJ4BCm3O+
 OgPt/alnFw5pRjUZ6oac3U5VIDgrsH4sMyy5sv8lUiVxVm1/UEP+5Mln9Cjr/ciEbs0l
 iWLQ==
X-Gm-Message-State: AOAM530vmWpnNGcHqWC0pfv2IxlDYAs7RFqtn5Q1+yWM+32RkIHaGR1M
 CsBmLKmWl+HkcG67n++yHWcXRHl7EPoBdxlBtYg=
X-Google-Smtp-Source: ABdhPJzIYbjU2ZRtbsX5ujNBEyUXQ0Ck1xktimwEcny8DIPMY2pIK1R5BDce2j9uPnOScdrs3iHcsy6eUFXqc2ScL60=
X-Received: by 2002:a19:ae16:: with SMTP id f22mr1436889lfc.313.1623989351335; 
 Thu, 17 Jun 2021 21:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210617084122.1117-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210617084122.1117-1-thunder.leizhen@huawei.com>
Date: Thu, 17 Jun 2021 23:09:00 -0500
Message-ID: <CAH2r5msQ4NKah88JOo4yX9jZtogLnfscULRtvbn21+aP=0x=jQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] cifs: remove unnecessary oom message
To: Zhen Lei <thunder.leizhen@huawei.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I am curious the motivation for these - I agree that removing the
debug messages saves (albeit trivial amount of) memory but curious
about how other areas of the kernel handle logging low memory/out of
memory issues?

On Thu, Jun 17, 2021 at 3:42 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
>
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
>
> Remove it can help us save a bit of memory.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  fs/cifs/cifsencrypt.c | 4 +---
>  fs/cifs/connect.c     | 6 +-----
>  fs/cifs/sess.c        | 6 +-----
>  fs/cifs/smb2pdu.c     | 2 --
>  4 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/fs/cifs/cifsencrypt.c b/fs/cifs/cifsencrypt.c
> index b8f1ff9a83f3..74f16730e502 100644
> --- a/fs/cifs/cifsencrypt.c
> +++ b/fs/cifs/cifsencrypt.c
> @@ -787,10 +787,8 @@ calc_seckey(struct cifs_ses *ses)
>         get_random_bytes(sec_key, CIFS_SESS_KEY_SIZE);
>
>         ctx_arc4 = kmalloc(sizeof(*ctx_arc4), GFP_KERNEL);
> -       if (!ctx_arc4) {
> -               cifs_dbg(VFS, "Could not allocate arc4 context\n");
> +       if (!ctx_arc4)
>                 return -ENOMEM;
> -       }
>
>         arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_KEY_SIZE);
>         arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key,
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 05f5c84a63a4..b52bb6dc6ecb 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -97,10 +97,8 @@ static int reconn_set_ipaddr_from_hostname(struct TCP_Server_Info *server)
>         len = strlen(server->hostname) + 3;
>
>         unc = kmalloc(len, GFP_KERNEL);
> -       if (!unc) {
> -               cifs_dbg(FYI, "%s: failed to create UNC path\n", __func__);
> +       if (!unc)
>                 return -ENOMEM;
> -       }
>         scnprintf(unc, len, "\\\\%s", server->hostname);
>
>         rc = dns_resolve_server_name_to_ip(unc, &ipaddr);
> @@ -1758,8 +1756,6 @@ cifs_set_cifscreds(struct smb3_fs_context *ctx, struct cifs_ses *ses)
>         if (is_domain && ses->domainName) {
>                 ctx->domainname = kstrdup(ses->domainName, GFP_KERNEL);
>                 if (!ctx->domainname) {
> -                       cifs_dbg(FYI, "Unable to allocate %zd bytes for domain\n",
> -                                len);
>                         rc = -ENOMEM;
>                         kfree(ctx->username);
>                         ctx->username = NULL;
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index cd19aa11f27e..cc97b2981c3d 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -602,10 +602,8 @@ int decode_ntlmssp_challenge(char *bcc_ptr, int blob_len,
>         if (tilen) {
>                 ses->auth_key.response = kmemdup(bcc_ptr + tioffset, tilen,
>                                                  GFP_KERNEL);
> -               if (!ses->auth_key.response) {
> -                       cifs_dbg(VFS, "Challenge target info alloc failure\n");
> +               if (!ses->auth_key.response)
>                         return -ENOMEM;
> -               }
>                 ses->auth_key.len = tilen;
>         }
>
> @@ -1338,8 +1336,6 @@ sess_auth_kerberos(struct sess_data *sess_data)
>         ses->auth_key.response = kmemdup(msg->data, msg->sesskey_len,
>                                          GFP_KERNEL);
>         if (!ses->auth_key.response) {
> -               cifs_dbg(VFS, "Kerberos can't allocate (%u bytes) memory\n",
> -                        msg->sesskey_len);
>                 rc = -ENOMEM;
>                 goto out_put_spnego_key;
>         }
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index c205f93e0a10..2b978564e188 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -1355,8 +1355,6 @@ SMB2_auth_kerberos(struct SMB2_sess_data *sess_data)
>                 ses->auth_key.response = kmemdup(msg->data, msg->sesskey_len,
>                                                  GFP_KERNEL);
>                 if (!ses->auth_key.response) {
> -                       cifs_dbg(VFS, "Kerberos can't allocate (%u bytes) memory\n",
> -                                msg->sesskey_len);
>                         rc = -ENOMEM;
>                         goto out_put_spnego_key;
>                 }
> --
> 2.25.1
>
>


-- 
Thanks,

Steve

