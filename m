Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1003AC1EB
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jun 2021 06:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6H4QkZaU5ORUZ1KVCHUaXIqHAtY5xVo3G4y/EPhgIgk=; b=B4kJ9afJ5Efd0nRMc70/xYZ3dI
	ILX4IoMQi9miOp7MX9c8aYxtWxKc1PSae3+26Er0O2msIwGhjw4QW1k3Iu/PhuhUWl+rPYoiXwHBa
	KkEPzdfdN0HiH8dP3fFn1gHiwoQXUZg1TDj6lcb4jcRliEVgpeSzWpBAk2pxIKw0OxK8yt7TgOafb
	pf6Ih3s6rQkZkt1rwRSylMs6eIJ7+91tnDVQT2UMw+BgWiE5uAKjCgvitbBB+RStjonaIX0OiO0bd
	/5v7uE/6DpbBqxlW8lD5ZCtD60lNOAHD1S/+yacoGSWRS6djIR4osSUsfk+Tn8Ip4soZd95CMHwhd
	nKZtUsyA==;
Received: from ip6-localhost ([::1]:42468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lu5y1-006iNK-P5; Fri, 18 Jun 2021 04:18:53 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:39680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lu5xv-006iNA-UH
 for samba-technical@lists.samba.org; Fri, 18 Jun 2021 04:18:50 +0000
Received: by mail-lj1-x229.google.com with SMTP id c11so12134009ljd.6
 for <samba-technical@lists.samba.org>; Thu, 17 Jun 2021 21:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6H4QkZaU5ORUZ1KVCHUaXIqHAtY5xVo3G4y/EPhgIgk=;
 b=jFitRzYsSkj6l7xDBW63GcidXvYhzCLU1dyDQgEgHemJE0bWS/X5Bayf9p9izcBPA2
 2EZCseNEglVSoM+TjgQbf5Xluza8yKI2psozGBY5aOIdvRFNQYhuq00ej51gTx9bts9F
 oFzKL/GOO5yiSFBLReduzGkBhvtWnm0U03GO9DvKbyoCZOin5oUFPCjxpZ8+Vcqa+2qn
 KOohSIkyMw4ASLwbR20Fpd4r9Fka+k12vyB9dRG1bkBYcFsET+Qvrvc/6cxuWQ9Nfxck
 RrjlnloRMw0EslXM5zmmSKZYP/hqlrZEcHfEVFKetDmFHmtnTdVgOaV6AIbap4nHPeF9
 BM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6H4QkZaU5ORUZ1KVCHUaXIqHAtY5xVo3G4y/EPhgIgk=;
 b=CYksbAlcigMBnLDU91Hg8SD+V/LofDd26RJXtUJP9z+vxYsK7reJ68rwNaU/CX4J2s
 UJy2g1LAed7sYlu13HKSXKLvSMbpDROq3+Mi1E/eYhw51yWJByYkJq6D6PCZJpqYD622
 fAIVKBILYKVZJ5+xzx3pPWlIobQkw6CWP/XSbrcKoyXz3TKDSOZfO5DG0ml7X5/Y1WPX
 ay8Now4X0a+cCVIHuLsJXQk8qFPwZ/HRiXUVgkk7qtHgXAH7ba1LsBIZ/K7mO9QJmkyX
 EfkQqI1Jmj2esEzrXYpOLXMCuzzaOP+k36hmpOYcHsct6+vc+14SAIN6L9nn7a333YUD
 ODWQ==
X-Gm-Message-State: AOAM533pJ6JW+HnLMv5UFEFqnQ7VZqbAl4fhwRGmRb757eChkDx4fS/H
 pXSUL5c4JiBTlsyGDIVN7s3SFzIC4DsNtkiCL20=
X-Google-Smtp-Source: ABdhPJzwq/cJ4iLuZha164RaW9qKFIOBq2+xcuN/3k+wguDHpVwDoW6hkrv9I2/OCPFkSzi6JTU1Q4VrK6doRcel3rc=
X-Received: by 2002:a2e:a7cd:: with SMTP id x13mr7623913ljp.218.1623989926694; 
 Thu, 17 Jun 2021 21:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210617113640.4141487-1-libaokun1@huawei.com>
In-Reply-To: <20210617113640.4141487-1-libaokun1@huawei.com>
Date: Thu, 17 Jun 2021 23:18:35 -0500
Message-ID: <CAH2r5ms4c37ykXetxy6CRL1WXWUZB59rFzm7ckG=0d-bYmnt1Q@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: convert list_for_each to entry variant in
 cifs_debug.c
To: Baokun Li <libaokun1@huawei.com>
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
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Hulk Robot <hulkci@huawei.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next

On Thu, Jun 17, 2021 at 6:40 AM Baokun Li <libaokun1@huawei.com> wrote:
>
> convert list_for_each() to list_for_each_entry() where
> applicable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>  fs/cifs/cifs_debug.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/fs/cifs/cifs_debug.c b/fs/cifs/cifs_debug.c
> index 68e8e5b27841..8857ac7e7a14 100644
> --- a/fs/cifs/cifs_debug.c
> +++ b/fs/cifs/cifs_debug.c
> @@ -50,7 +50,6 @@ void cifs_dump_detail(void *buf, struct TCP_Server_Info *server)
>  void cifs_dump_mids(struct TCP_Server_Info *server)
>  {
>  #ifdef CONFIG_CIFS_DEBUG2
> -       struct list_head *tmp;
>         struct mid_q_entry *mid_entry;
>
>         if (server == NULL)
> @@ -58,8 +57,7 @@ void cifs_dump_mids(struct TCP_Server_Info *server)
>
>         cifs_dbg(VFS, "Dump pending requests:\n");
>         spin_lock(&GlobalMid_Lock);
> -       list_for_each(tmp, &server->pending_mid_q) {
> -               mid_entry = list_entry(tmp, struct mid_q_entry, qhead);
> +       list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
>                 cifs_dbg(VFS, "State: %d Cmd: %d Pid: %d Cbdata: %p Mid %llu\n",
>                          mid_entry->mid_state,
>                          le16_to_cpu(mid_entry->command),
> @@ -168,7 +166,7 @@ cifs_dump_iface(struct seq_file *m, struct cifs_server_iface *iface)
>
>  static int cifs_debug_files_proc_show(struct seq_file *m, void *v)
>  {
> -       struct list_head *stmp, *tmp, *tmp1, *tmp2;
> +       struct list_head *tmp, *tmp1, *tmp2;
>         struct TCP_Server_Info *server;
>         struct cifs_ses *ses;
>         struct cifs_tcon *tcon;
> @@ -183,9 +181,7 @@ static int cifs_debug_files_proc_show(struct seq_file *m, void *v)
>         seq_printf(m, " <filename>\n");
>  #endif /* CIFS_DEBUG2 */
>         spin_lock(&cifs_tcp_ses_lock);
> -       list_for_each(stmp, &cifs_tcp_ses_list) {
> -               server = list_entry(stmp, struct TCP_Server_Info,
> -                                   tcp_ses_list);
> +       list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
>                 list_for_each(tmp, &server->smb_ses_list) {
>                         ses = list_entry(tmp, struct cifs_ses, smb_ses_list);
>                         list_for_each(tmp1, &ses->tcon_list) {
> @@ -220,7 +216,7 @@ static int cifs_debug_files_proc_show(struct seq_file *m, void *v)
>
>  static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
>  {
> -       struct list_head *tmp1, *tmp2, *tmp3;
> +       struct list_head *tmp2, *tmp3;
>         struct mid_q_entry *mid_entry;
>         struct TCP_Server_Info *server;
>         struct cifs_ses *ses;
> @@ -278,11 +274,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
>
>         c = 0;
>         spin_lock(&cifs_tcp_ses_lock);
> -       list_for_each(tmp1, &cifs_tcp_ses_list) {
> -               server = list_entry(tmp1, struct TCP_Server_Info,
> -                                   tcp_ses_list);
> -
> -               /* channel info will be printed as a part of sessions below */
> +       list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
>                 if (server->is_channel)
>                         continue;
>
> @@ -563,7 +555,7 @@ static int cifs_stats_proc_show(struct seq_file *m, void *v)
>  #ifdef CONFIG_CIFS_STATS2
>         int j;
>  #endif /* STATS2 */
> -       struct list_head *tmp1, *tmp2, *tmp3;
> +       struct list_head *tmp2, *tmp3;
>         struct TCP_Server_Info *server;
>         struct cifs_ses *ses;
>         struct cifs_tcon *tcon;
> @@ -594,9 +586,7 @@ static int cifs_stats_proc_show(struct seq_file *m, void *v)
>
>         i = 0;
>         spin_lock(&cifs_tcp_ses_lock);
> -       list_for_each(tmp1, &cifs_tcp_ses_list) {
> -               server = list_entry(tmp1, struct TCP_Server_Info,
> -                                   tcp_ses_list);
> +       list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
>                 seq_printf(m, "\nMax requests in flight: %d", server->max_in_flight);
>  #ifdef CONFIG_CIFS_STATS2
>                 seq_puts(m, "\nTotal time spent processing by command. Time ");
>


-- 
Thanks,

Steve

