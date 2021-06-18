Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 993373AC1DE
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jun 2021 06:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=mCvwX5+vk8V7BQG3zhJB8owe7BcQtEPZvcZWN8YaLew=; b=bSvJ6gtPCz4ZJsbJBLGqAwsu2e
	gqWJcrVnXYFszqGQ9TcI5zbd+37RHLsV2vWvaL6EKZ7fbLO4Ocu2K8Np3Sm6ZZkLvKlPKs4p0DwTw
	HMVV3kJP86FfG4ZFjCwNnDOpeGGxm3fIbad9AniYdIbGyjtJqFhjuGolDkbddJTJE6cmXzFsTPlk5
	/rc3CFTzetql/b8XTVuBia4iU/+aB2+6OHd7kEwPhfGYYHIhasZOPNM0XsGoEqoJzeRxZoWf7krbV
	faGGQ6v4/l/QA8F5KCFi/bC6ZVt2NPLwjZe/6cuVKsqrcbFe+DMXvC6O5Gw38IUwLtZ0KFRmfr9y9
	Dm6rgVhw==;
Received: from ip6-localhost ([::1]:41786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lu5vu-006i4w-8N; Fri, 18 Jun 2021 04:16:42 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:38524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lu5vp-006i4n-6A
 for samba-technical@lists.samba.org; Fri, 18 Jun 2021 04:16:39 +0000
Received: by mail-lj1-x234.google.com with SMTP id s22so12138687ljg.5
 for <samba-technical@lists.samba.org>; Thu, 17 Jun 2021 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mCvwX5+vk8V7BQG3zhJB8owe7BcQtEPZvcZWN8YaLew=;
 b=oEYG8+1CdEWGShhblOI/IyYWbzHssVqmiSiHw5NzI8Mp8BwFBsE+tvAN9SKTZosZ8C
 cVmuWm4BKMXDz2GNjzBvWoYQhMyG8PiBunVcmZXWAF0zJBxgCEe+UKRHfzaW0LmTNjkD
 RQFNhEZvTFGKfx0ApcUyomqirzARoHl75LAv7FoPZFR3xsvfFCpbgIalrAR+TNIOHCub
 iNW1U6t6llTqFiN55Z7gcwmLPJEgUiaM3xQ1xVsxrTW4muT38lWurIkdTVjHQB6KGi1+
 JRhE5uHMM8CawEo2dPpGQAtPDmpJex6bs3ztJLhKJt6D7j9OwPQfxkJ/FlVKay4Z6ACj
 O68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCvwX5+vk8V7BQG3zhJB8owe7BcQtEPZvcZWN8YaLew=;
 b=N8JhAPZOS5uUOtKsKr+bEdnNGB0wZsfMDr32aZfekHfZ+SjDRagrLz5aqi2Wlyfd5x
 anGGFFi6245WUOoJwiX1LKJ7H+4rcDiFWk6xSKw2gjTB8sudzvyVgVPvBzaqDM2EDCdt
 q+l6XJmbotHHJzpiGMSIftznhPCCmYc5qVKhQEOY49dEhHnXNqb1quFjORbgCVUwsIT6
 Udt1NaLKny+7V4W/vHEYBZNZhV0CdK2z4Y9YgL+xd5+qgPASI37iDkgUZM3kijuC6nlg
 1NgxXus/rjUHz4CWGhruBnzzEdd/7ApnwwSssLxV9c4lXENTPDekBYUzSaJWLrP/JU61
 V51g==
X-Gm-Message-State: AOAM5307NWeP3YbhDkXvWreSlEVdCRcy7IjEXnPeGRCLTQ83BLjAxtb2
 EKJ/WsIeHMvkA001aadE94m2wvT8kNG+41mGFkM=
X-Google-Smtp-Source: ABdhPJyUpDXqDD148jq7aVQbdrvt2B+K8YJqgK8iUPmc8bAHZhIJU3ufjCvD+JeK061NBce1HekS9JsPcwAIEHa94oA=
X-Received: by 2002:a2e:a234:: with SMTP id i20mr7894780ljm.272.1623989795895; 
 Thu, 17 Jun 2021 21:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210618040232.2550645-1-libaokun1@huawei.com>
In-Reply-To: <20210618040232.2550645-1-libaokun1@huawei.com>
Date: Thu, 17 Jun 2021 23:16:24 -0500
Message-ID: <CAH2r5msqnE+1=yfd_E32MNY0qpgRokMJzQ4j88_RC2rBYGMxqQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] cifs: convert list_for_each to entry variant in
 smb2misc.c
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Hulk Robot <hulkci@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next

On Thu, Jun 17, 2021 at 11:02 PM Baokun Li <libaokun1@huawei.com> wrote:
>
> convert list_for_each() to list_for_each_entry() where
> applicable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
> V1->V2:
>         Convert the missing list_for_each to entry
>
>  fs/cifs/smb2misc.c | 33 ++++++++-------------------------
>  1 file changed, 8 insertions(+), 25 deletions(-)
>
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 06d555d4da9a..aba048153f79 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -164,12 +164,10 @@ smb2_check_message(char *buf, unsigned int len, struct TCP_Server_Info *srvr)
>                 struct smb2_transform_hdr *thdr =
>                         (struct smb2_transform_hdr *)buf;
>                 struct cifs_ses *ses = NULL;
> -               struct list_head *tmp;
>
>                 /* decrypt frame now that it is completely read in */
>                 spin_lock(&cifs_tcp_ses_lock);
> -               list_for_each(tmp, &srvr->smb_ses_list) {
> -                       ses = list_entry(tmp, struct cifs_ses, smb_ses_list);
> +               list_for_each_entry(ses, &srvr->smb_ses_list, smb_ses_list) {
>                         if (ses->Suid == thdr->SessionId)
>                                 break;
>
> @@ -548,7 +546,6 @@ static bool
>  smb2_tcon_has_lease(struct cifs_tcon *tcon, struct smb2_lease_break *rsp)
>  {
>         __u8 lease_state;
> -       struct list_head *tmp;
>         struct cifsFileInfo *cfile;
>         struct cifsInodeInfo *cinode;
>         int ack_req = le32_to_cpu(rsp->Flags &
> @@ -556,8 +553,7 @@ smb2_tcon_has_lease(struct cifs_tcon *tcon, struct smb2_lease_break *rsp)
>
>         lease_state = le32_to_cpu(rsp->NewLeaseState);
>
> -       list_for_each(tmp, &tcon->openFileList) {
> -               cfile = list_entry(tmp, struct cifsFileInfo, tlist);
> +       list_for_each_entry(cfile, &tcon->openFileList, tlist) {
>                 cinode = CIFS_I(d_inode(cfile->dentry));
>
>                 if (memcmp(cinode->lease_key, rsp->LeaseKey,
> @@ -618,7 +614,6 @@ static bool
>  smb2_is_valid_lease_break(char *buffer)
>  {
>         struct smb2_lease_break *rsp = (struct smb2_lease_break *)buffer;
> -       struct list_head *tmp, *tmp1, *tmp2;
>         struct TCP_Server_Info *server;
>         struct cifs_ses *ses;
>         struct cifs_tcon *tcon;
> @@ -628,15 +623,9 @@ smb2_is_valid_lease_break(char *buffer)
>
>         /* look up tcon based on tid & uid */
>         spin_lock(&cifs_tcp_ses_lock);
> -       list_for_each(tmp, &cifs_tcp_ses_list) {
> -               server = list_entry(tmp, struct TCP_Server_Info, tcp_ses_list);
> -
> -               list_for_each(tmp1, &server->smb_ses_list) {
> -                       ses = list_entry(tmp1, struct cifs_ses, smb_ses_list);
> -
> -                       list_for_each(tmp2, &ses->tcon_list) {
> -                               tcon = list_entry(tmp2, struct cifs_tcon,
> -                                                 tcon_list);
> +       list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
> +               list_for_each_entry(ses, &server->smb_ses_list, smb_ses_list) {
> +                       list_for_each_entry(tcon, &ses->tcon_list, tcon_list) {
>                                 spin_lock(&tcon->open_file_lock);
>                                 cifs_stats_inc(
>                                     &tcon->stats.cifs_stats.num_oplock_brks);
> @@ -687,7 +676,6 @@ bool
>  smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>  {
>         struct smb2_oplock_break *rsp = (struct smb2_oplock_break *)buffer;
> -       struct list_head *tmp, *tmp1, *tmp2;
>         struct cifs_ses *ses;
>         struct cifs_tcon *tcon;
>         struct cifsInodeInfo *cinode;
> @@ -710,16 +698,11 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>
>         /* look up tcon based on tid & uid */
>         spin_lock(&cifs_tcp_ses_lock);
> -       list_for_each(tmp, &server->smb_ses_list) {
> -               ses = list_entry(tmp, struct cifs_ses, smb_ses_list);
> -
> -               list_for_each(tmp1, &ses->tcon_list) {
> -                       tcon = list_entry(tmp1, struct cifs_tcon, tcon_list);
> +       list_for_each_entry(ses, &server->smb_ses_list, smb_ses_list) {
> +               list_for_each_entry(tcon, &ses->tcon_list, tcon_list) {
>
>                         spin_lock(&tcon->open_file_lock);
> -                       list_for_each(tmp2, &tcon->openFileList) {
> -                               cfile = list_entry(tmp2, struct cifsFileInfo,
> -                                                    tlist);
> +                       list_for_each_entry(cfile, &tcon->openFileList, tlist) {
>                                 if (rsp->PersistentFid !=
>                                     cfile->fid.persistent_fid ||
>                                     rsp->VolatileFid !=
> --
> 2.31.1
>


-- 
Thanks,

Steve

