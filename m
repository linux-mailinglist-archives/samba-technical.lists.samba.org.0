Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006E2D4E65
	for <lists+samba-technical@lfdr.de>; Wed,  9 Dec 2020 23:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OARGU6Bu8PzoLPoT0tVzNvAZI6gkjtNmkj1rNBeElNg=; b=OEjR/J8oiyN9/gZA0gIyLC6IWz
	BcLBCkANadTku0fniQuUWtnschA3ULDOeHvXjUGFglL6MBkeO7BjeUlT1s/OVa40SyJEOrQjQEQWg
	14+CxjJKF4jF7xy//J4+7BNhSJMVizqxxIv1RQ4JMPE+k4ZhXly/DesNSICqikQNi2Bvucm0kbcTd
	/MFmWWyaAOOl6OKpusmVfvzq05a3Nk62p60A2g0QROMaDXjJQBk0GRcuP50KE8fGMkgKiiNpoh7xO
	hhKnLV49Tz4Ko26bBoYpRth6MNMor1bHtybepD9jDzdDJIMc1+jQiO5Ahhg7Epc1Bre3mzisPh0yY
	iuLAPYWg==;
Received: from ip6-localhost ([::1]:59700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kn8OQ-000KCq-3Y; Wed, 09 Dec 2020 22:57:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33351) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kn8OK-000KCj-81
 for samba-technical@lists.samba.org; Wed, 09 Dec 2020 22:57:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id p4so2193816pfg.0
 for <samba-technical@lists.samba.org>; Wed, 09 Dec 2020 14:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edu.singelland.nl; s=leerlingen;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=AP12z4l3LmYOB38XToAOkwN3anVtm/qAePpSH4/VMBw=;
 b=dzmtlPBnkK6P4m1utYBE4OpwZ27RX8BUajDNfANXWgs7GuALf3dbgoJwTqtGxBqrH7
 aWIavrfTi1FZk7V16/+tF+2touJnpsgRZpsKPBt40d1WtUwRJtipLpJblXKFpAWaak1G
 B7Esf1m7Ql33tSjnx1poCFNNNAEfSwODD5K+Dg+Iuq2J6JxVvJyVbpwBoqZBgQ8uuaDy
 DhPVShO/RwBdPyboo8aYxaEyVJ0ly6u1OhDuMiCcpblvyGhWcvWbXRCzHInV/PAhoCHJ
 +lafDVzGFm7GoIFNCTKriKqfCUbgEwtebqAOX/1d8uJIep670LwDqXUO1+T1TEOef8ff
 v0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=AP12z4l3LmYOB38XToAOkwN3anVtm/qAePpSH4/VMBw=;
 b=VnqnvNjaXOM5L4HINg50YVhMbY0brGehEYdL68gwnw5cZ8TYTJJWmu97p95hJq7IPP
 Saw3Jru/135WUhVmv85h5FJ38XMdtLGj0JqxoKk5vw244b6N2wrJZFy0PuPRA4MYN0n7
 93HKfrqIFJjHXTjNEUTS8Xm9/aMF2u8GrUI57CEot+PRtam1EBHuBX8VarBJ1w7aA3jH
 dh9LPJWgqeR5SG/vRX81kpkQhpaKkqzeIs1kdY7vv2JiLRJDGR5wWWBaMFHOg8PHTsAt
 3oJYAAkSqglPO6s30i3ppS+4eBelDMQiq0f0H3lIF6xtcTHpxGiP5xfSjWd+CQSmAiFR
 kh8w==
X-Gm-Message-State: AOAM53037d+j1XZCMoXABCPHLUNEAVrdDra4gVUzoFvG0EOKcrFTIo3B
 48ED3XfNkhvjm2Qbv06MUgNXxAat1EOJOgUzmyt1AXXarzlI
X-Google-Smtp-Source: ABdhPJy++5RPlq3SoMqlDZSGvMiPusufInbP5JXtKZ58bP+CNbFWwd/ehhdLk5hTI6ugmGlMmDCxyvQQWncriBZtkps=
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr2347218pfl.80.1607521552274; Wed, 09 Dec
 2020 05:45:52 -0800 (PST)
MIME-Version: 1.0
References: <E1kma8A-0043no-2r@hrx0.samba.org>
In-Reply-To: <E1kma8A-0043no-2r@hrx0.samba.org>
Date: Wed, 9 Dec 2020 14:45:39 +0100
Message-ID: <CAAr6HVWoL_9x92Y_YjomX9dwjbF_phS-oX+OAPMbVCJy7YAvNg@mail.gmail.com>
Subject: Re: [SCM] Samba Shared Repository - branch v4-13-test updated
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Bo Bosma via samba-technical <samba-technical@lists.samba.org>
Reply-To: Bo Bosma <130273@edu.singelland.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

yo sambabal,
dont mail me you ugly cow fatass mother fucker id dont LIKE YOU
NOW FUCK OFF PLZ
:)
BYEEEEEE

Op di 8 dec. 2020 om 11:22 schreef Karolin Seeger <kseeger@samba.org>:

> The branch, v4-13-test has been updated
>        via  54d3d3cbf49 s3: smbd: Quiet log messages from usershares for
> an unknown share.
>        via  f7490ec9d94 s3-libads: Pass timeout to open_socket_out in ms
>       from  585c49f21f7 vfs_glusterfs: print exact cmdline for disabling
> write-behind translator
>
> https://git.samba.org/?p=samba.git;a=shortlog;h=v4-13-test
>
>
> - Log -----------------------------------------------------------------
> commit 54d3d3cbf49b660f7e93aa45caa94fa6821c0999
> Author: Jeremy Allison <jra@samba.org>
> Date:   Wed Dec 2 11:47:02 2020 -0800
>
>     s3: smbd: Quiet log messages from usershares for an unknown share.
>
>     No need to log missing shares/sharenames at debug level zero.
>
>     Keep the debug level zero for all other usershare problems.
>
>     BUG: https://bugzilla.samba.org/show_bug.cgi?id=14590
>
>     Signed-off-by: Jeremy Allison <jra@samba.org>
>     Reviewed-by: Rowland penny <rpenny@samba.org>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>
>     Autobuild-User(master): Jeremy Allison <jra@samba.org>
>     Autobuild-Date(master): Fri Dec  4 20:54:06 UTC 2020 on sn-devel-184
>
>     (cherry picked from commit 8a0a7359faba642baf55a8f98ff78c0d0884d0f0)
>
>     Autobuild-User(v4-13-test): Karolin Seeger <kseeger@samba.org>
>     Autobuild-Date(v4-13-test): Tue Dec  8 10:21:11 UTC 2020 on
> sn-devel-184
>
> commit f7490ec9d94edfc9cdc79e70580b3b226a2022d5
> Author: Isaac Boukris <iboukris@gmail.com>
> Date:   Tue Jul 14 22:38:06 2020 +0200
>
>     s3-libads: Pass timeout to open_socket_out in ms
>
>     BUG: https://bugzilla.samba.org/show_bug.cgi?id=13124
>
>     Signed-off-by: Isaac Boukris <iboukris@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
>
>     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>     Autobuild-Date(master): Thu Jul 16 10:41:40 UTC 2020 on sn-devel-184
>
>     (cherry picked from commit d67e9149a612044e247e7a4d78913ecf396c69fc)
>
> -----------------------------------------------------------------------
>
> Summary of changes:
>  source3/libads/ldap.c    |  4 +++-
>  source3/param/loadparm.c | 10 ++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
>
> Changeset truncated at 500 lines:
>
> diff --git a/source3/libads/ldap.c b/source3/libads/ldap.c
> index 10ab043f721..ee4628a09a2 100755
> --- a/source3/libads/ldap.c
> +++ b/source3/libads/ldap.c
> @@ -96,9 +96,11 @@ static void gotalarm_sig(int signum)
>         {
>                 int fd = -1;
>                 NTSTATUS status = NT_STATUS_UNSUCCESSFUL;
> +               unsigned timeout_ms = 1000 * to;
>
> -               status = open_socket_out(ss, port, to, &fd);
> +               status = open_socket_out(ss, port, timeout_ms, &fd);
>                 if (!NT_STATUS_IS_OK(status)) {
> +                       DEBUG(3, ("open_socket_out: failed to open
> socket\n"));
>                         return NULL;
>                 }
>
> diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
> index 6674485738a..a3abaa2ec67 100644
> --- a/source3/param/loadparm.c
> +++ b/source3/param/loadparm.c
> @@ -3418,6 +3418,11 @@ static int process_usershare_file(const char
> *dir_name, const char *file_name, i
>            open and fstat. Ensure this isn't a symlink link. */
>
>         if (sys_lstat(fname, &lsbuf, false) != 0) {
> +               if (errno == ENOENT) {
> +                       /* Unknown share requested. Just ignore. */
> +                       goto out;
> +               }
> +               /* Only log messages for meaningful problems. */
>                 DEBUG(0,("process_usershare_file: stat of %s failed. %s\n",
>                         fname, strerror(errno) ));
>                 goto out;
> @@ -3623,6 +3628,11 @@ int load_usershare_service(const char *servicename)
>         int max_user_shares = Globals.usershare_max_shares;
>         int snum_template = -1;
>
> +       if (servicename[0] == '\0') {
> +               /* Invalid service name. */
> +               return -1;
> +       }
> +
>         if (*usersharepath == 0 ||  max_user_shares == 0) {
>                 return -1;
>         }
>
>
> --
> Samba Shared Repository
>
>
