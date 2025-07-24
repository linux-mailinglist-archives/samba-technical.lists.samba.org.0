Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7546B113AD
	for <lists+samba-technical@lfdr.de>; Fri, 25 Jul 2025 00:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VZnVVLlrcEVEr5hjD+iZ2LCCZaPGWsO8wLtJ8esj5Oo=; b=a01Wl5IAj+iWOdVS49th/DWj/2
	d8hM/SXHTVl5qjj/z5/GYt0wqw269y7xDxE3yf7HxObsSkGcSQWLobKZQGEhz8s/VoEBIhO1k/oWx
	SKfJAVm2tiAcq55xNHiw9RkxPJLALgChhc2VYmz+hOTh0TMPmk0j5T6TZExy70TFWblUL1BoS5Obm
	ZqhHdrPft4UZPwM9dlrMf+K/JcuVB8iXn30ik/THF8ugb01prbpQ8Hfc1s2s/q2pyA+Y59acYT3cT
	yIcZavatDs+iuxxb1nQTm2i8qs2Nv+AnU8wmIlqR1XTFeRTFV4nbjmV+pvW+7A98ZmGpkcQYK7VcP
	0B7Nzntw==;
Received: from ip6-localhost ([::1]:56736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uf4Cl-00Bk3U-3I; Thu, 24 Jul 2025 22:14:23 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:50265) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uf4Cg-00Bk3N-Fh
 for samba-technical@lists.samba.org; Thu, 24 Jul 2025 22:14:21 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6fd0a7d3949so21132056d6.0
 for <samba-technical@lists.samba.org>; Thu, 24 Jul 2025 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753395256; x=1754000056; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZnVVLlrcEVEr5hjD+iZ2LCCZaPGWsO8wLtJ8esj5Oo=;
 b=Uh9543qbFlFukqszWhf6vKKchQBTs8OSsMSzVXzn6JrQm7irsp8UkC01mfEqbiKkJF
 qJZorgxsaS5wHzIgxFMUJGPxtSwABfDw3102nbLj2qfdTeef/4uDKO1+WYVrMbtozhyi
 r+YpC6H+TTywG5z7hiA7KGOTFP8M5aRxk8hP+vQSCAeI36noGtd3z+gbRUQ8WIsOKH7x
 b8eVypBKQP1evYvLzQRj3yaeSW8KQ0JZji4CmJTy/Ql2/aysVgZwynEO7hcPpL+yXUug
 IHv6oYa/ehy+MNaC1JFDDUgtq+nMMWi0R58qlBrN92x04JGMeGAWMhcDYmdj9sTMKsPK
 2vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753395256; x=1754000056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZnVVLlrcEVEr5hjD+iZ2LCCZaPGWsO8wLtJ8esj5Oo=;
 b=ExSYO6tT8hFjizQub4R5xuBGVGlZdC+NjvxzIlK1XgjyNDTAwGXz/XQTaoQ/oPWe2j
 xaJ1SQqM73eZi0bIJ2zLjQrKqy6xOJQ2V8MYztz6wnxCehWHWZJA4IlITVIXW0ubTupH
 rIX4KN5p+Nvm5ZWHeM+nd6MZvY/h4lMh8c6O23gEUyfcTw993zeXTW17AC/UtlTcOHOF
 S0I5mF+OXUCmyyRkCf8kBcrplHFE+9ypBw0W/ApIEXF9zbBMEe97rRy6SO0R6g8n2HY/
 xJFS6dw9D9yZf+KZKwEtPJNl//WYOIENjtXgJcT+u2bQ1ij+XzzOUHd03DxlXvimeM0Y
 sqpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBk6J7kuNiwrpRA0oGVlGVXZliD0hTf/3zn8ZQlcg6NLSN3aPVRnyIdYod+OBv2Rfu9Sl02oxtpmROfY5agnk=@lists.samba.org
X-Gm-Message-State: AOJu0Yy3b0pydmW4tjUtzA4jli0+0JI/35ZzgYdu/oPw2Fn5TOqwxwBP
 XqWs3rtnpkET/VnlXge6YeCoBH96H3mnc1fUCxnlLxsmrP5ewvQfFt/hh95fOPVtKbrgeuBl19C
 hJwcuHTrCd6buuG4wV/5HG6mMtd5CtaU=
X-Gm-Gg: ASbGnctpqsd7aS27o49z+r/D6XY1MMMvO/AvQg8Bb97sNb1z7a9L29mW9kzkxx4Z723
 +i81IHOGUdTgw6JaLuN4n/ZwxHKYvi6NRScaaPXUtasKCESKw/H9gFSTBXIeALI6E0WqI46uwfe
 PTfKgmW36HXtZQQbHXLbBfIA08rBpqj09II+3jx0GeLKXIbFjm9d2zXN6h271N7Uc2DvCOZTmIB
 eZvuaHdSCZSjPNuikitBL4LcA3My0L41d6a15/K
X-Google-Smtp-Source: AGHT+IF8lDKSbsv7Xt/nQAjmr0n187VN1liTWXgRffnaeVPKl7Hh/ao0HbxePDhr7FOLi4zRLbWtVLZlLhWSozAVqFI=
X-Received: by 2002:a05:6214:2022:b0:702:d7e2:88b7 with SMTP id
 6a1803df08f44-707005d411emr108291256d6.6.1753395256336; Thu, 24 Jul 2025
 15:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250516152201.201385-1-alxvmr@altlinux.org>
 <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
 <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
In-Reply-To: <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
Date: Thu, 24 Jul 2025 17:14:05 -0500
X-Gm-Features: Ac12FXxtNpL-4toS9CgZ6_OrmNbwHgoMuFbu24XVtF_8dGytiZG7QyMPJoZDvsg
Message-ID: <CAH2r5mtG5pwFMRtu3EeXKPBdq0LJwjt84SbGtL0J4QuCg+AsgQ@mail.gmail.com>
Subject: Re: [PATCH] fs/smb/client/fs_context: Add hostname option for CIFS
 module to work with domain-based dfs resources with Kerberos authentication
To: alxvmr@altlinux.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Ivan Volchenko <ivolchenko86@gmail.com>, samba-technical@lists.samba.org,
 Vitaly Chikunov <vt@altlinux.org>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I will update the mount parm name, similar to what Tom suggested to
"dfs_domain_hostname" to be less confusing.

Let me know if you had a v2 of the patch with other changes

On Thu, Jul 3, 2025 at 8:00=E2=80=AFAM Maria Alexeeva via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 6/14/25 07:42, Vitaly Chikunov wrote:
> > Maria,
> >
> > On Fri, May 16, 2025 at 07:22:01PM +0400, Maria Alexeeva wrote:
> >> Paths to domain-based dfs resources are defined using the domain name
> >> of the server in the format:
> >> \\DOMAIN.NAME>\<dfsroot>\<path>
> >>
> >> The CIFS module, when requesting a TGS, uses the server name
> >> (<DOMAIN.NAME>) it obtained from the UNC for the initial connection.
> >> It then composes an SPN that does not match any entities
> >> in the domain because it is the domain name itself.
> > For a casual reader like me it's hard to understand (this abbreviation
> > filled message) what it's all about. And why we can't just change syste=
m
> > hostname for example.
>
> This option is needed to transfer the real name of the server to which
> the connection is taking place,
> when using the UNC path in the form of domain-based DFS. The system
> hostname has nothing to do with it.
>
> > Also, the summary (subject) message is 180 character which is way above
> > 75 characters suggested in submitting-patches.rst.
> >
> >> To eliminate this behavior, a hostname option is added, which is
> >> the name of the server to connect to and is used in composing the SPN.
> >> In the future this option will be used in the cifs-utils development.
> >>
> >> Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
> >> Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
> >> ---
> >>   fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++------
> >>   fs/smb/client/fs_context.h |  3 +++
> >>   2 files changed, 32 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> >> index a634a34d4086..74de0a9de664 100644
> >> --- a/fs/smb/client/fs_context.c
> >> +++ b/fs/smb/client/fs_context.c
> >> @@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_parameters[=
] =3D {
> >>      fsparam_string("password2", Opt_pass2),
> >>      fsparam_string("ip", Opt_ip),
> >>      fsparam_string("addr", Opt_ip),
> >> +    fsparam_string("hostname", Opt_hostname),
> >>      fsparam_string("domain", Opt_domain),
> >>      fsparam_string("dom", Opt_domain),
> >>      fsparam_string("srcaddr", Opt_srcaddr),
> >> @@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs_co=
ntext *fc)
> >>              return -ENOENT;
> >>      }
> >>
> >> +    if (ctx->got_opt_hostname) {
> >> +            kfree(ctx->server_hostname);
> >> +            ctx->server_hostname =3D ctx->opt_hostname;
> > I am not familiar with the smb codebase but are you sure this will not
> > cause a race?
>
> The race condition will not occur.
> ctx->server_hostname is also used in smb3_parse_devname inside
> smb3_fs_context_parse_param.
> smb3_fs_context_parse_param is called earlier than the updated
> smb3_fs_context_validate, which is called inside smb3_get_tree:
>
> static const struct fs_context_operations smb3_fs_context_ops =3D {
>   .free   =3D smb3_fs_context_free,
>   .parse_param  =3D smb3_fs_context_parse_param,
>   .parse_monolithic =3D smb3_fs_context_parse_monolithic,
>   .get_tree  =3D smb3_get_tree,
>   .reconfigure  =3D smb3_reconfigure,
> };
>
> >> +            pr_notice("changing server hostname to name provided in h=
ostname=3D option\n");
> >> +    }
> >> +
> >>      if (!ctx->got_ip) {
> >>              int len;
> >> -            const char *slash;
> >>
> >> -            /* No ip=3D option specified? Try to get it from UNC */
> >> -            /* Use the address part of the UNC. */
> >> -            slash =3D strchr(&ctx->UNC[2], '\\');
> >> -            len =3D slash - &ctx->UNC[2];
> >> +            /*
> >> +             * No ip=3D option specified? Try to get it from server_h=
ostname
> >> +             * Use the address part of the UNC parsed into server_hos=
tname
> >> +             * or hostname=3D option if specified.
> >> +             */
> >> +            len =3D strlen(ctx->server_hostname);
> >>              if (!cifs_convert_address((struct sockaddr *)&ctx->dstadd=
r,
> >> -                                      &ctx->UNC[2], len)) {
> >> +                                      ctx->server_hostname, len)) {
> >>                      pr_err("Unable to determine destination address\n=
");
> >>                      return -EHOSTUNREACH;
> >>              }
> >> @@ -1518,6 +1526,21 @@ static int smb3_fs_context_parse_param(struct f=
s_context *fc,
> >>              }
> >>              ctx->got_ip =3D true;
> >>              break;
> >> +    case Opt_hostname:
> >> +            if (strnlen(param->string, CIFS_NI_MAXHOST) =3D=3D CIFS_N=
I_MAXHOST) {
> >> +                    pr_warn("host name too long\n");
> >> +                    goto cifs_parse_mount_err;
> >> +            }
> >> +
> >> +            kfree(ctx->opt_hostname);
> >> +            ctx->opt_hostname =3D kstrdup(param->string, GFP_KERNEL);
> >> +            if (ctx->opt_hostname =3D=3D NULL) {
> >> +                    cifs_errorf(fc, "OOM when copying hostname string=
\n");
> >> +                    goto cifs_parse_mount_err;
> >> +            }
> >> +            cifs_dbg(FYI, "Host name set\n");
> >> +            ctx->got_opt_hostname =3D true;
> >> +            break;
> >>      case Opt_domain:
> >>              if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
> >>                              =3D=3D CIFS_MAX_DOMAINNAME_LEN) {
> >> diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
> >> index 9e83302ce4b8..cf0478b1eff9 100644
> >> --- a/fs/smb/client/fs_context.h
> >> +++ b/fs/smb/client/fs_context.h
> >> @@ -184,6 +184,7 @@ enum cifs_param {
> >>      Opt_pass,
> >>      Opt_pass2,
> >>      Opt_ip,
> >> +    Opt_hostname,
> >>      Opt_domain,
> >>      Opt_srcaddr,
> >>      Opt_iocharset,
> >> @@ -214,6 +215,7 @@ struct smb3_fs_context {
> >>      bool gid_specified;
> >>      bool sloppy;
> >>      bool got_ip;
> >> +    bool got_opt_hostname;
> >>      bool got_version;
> >>      bool got_rsize;
> >>      bool got_wsize;
> >> @@ -226,6 +228,7 @@ struct smb3_fs_context {
> >>      char *domainname;
> >>      char *source;
> >>      char *server_hostname;
> >> +    char *opt_hostname;
> > Perhaps, smb3_fs_context_dup and smb3_cleanup_fs_context_contents shoul=
d
> > be aware of these new fields too.
>
> smb3_cleanup_fs_context_contents should be aware of these new fields too.
>
> Clearing in smb3_cleanup_fs_context_contents is not necessary, because
> if opt_hostname !=3D NULL,
> then the pointer in server_hostname is replaced (it is pre-cleared by
> kfree), respectively, everything
> will be cleared by itself with the current code.
>
> In smb3_fs_context_dup, opt_hostname does not need to be processed,
> since this variable is
> essentially temporary. Immediately after parsing with the parameter, its
> value goes to
> server_hostname and it is no longer needed by itself.
>
> > Thanks,
> >
> >>      char *UNC;
> >>      char *nodename;
> >>      char workstation_name[CIFS_MAX_WORKSTATION_LEN];
> >>
> >> base-commit: bec6f00f120ea68ba584def5b7416287e7dd29a7
> >> --
> >> 2.42.2
> >>
>
> Apologies for the overly long subject line and unclear description.
> Thanks.
>


--=20
Thanks,

Steve

