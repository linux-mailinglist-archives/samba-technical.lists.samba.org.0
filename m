Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA7B11441
	for <lists+samba-technical@lfdr.de>; Fri, 25 Jul 2025 00:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=39cgBMuM/za0y8OMAsLx2omC07JVqPDTO8m8S/8xgkg=; b=WmX2tdmUBARnAGgpNbdW8CZvKT
	oogYj6FjK+vi3GFe3pRFwy2CtHNyzmAkdY4l+nF4sDHb90o2VnXgp/fJJKok8P7JOawABjfPZQOVv
	G3OR+/Wz6L+fqIcXn3WK5l5XVALZYxoSK5Wv7PKiiIrixTGO2As6b9/8b5MA1G+02hwp6hiGETLyh
	4Q7jp/N+i/4eAe5URl2x+ujA7jUFT6RqEjZrIAZMhPaGd42hr39tKvhpV56yYh179p43XzzPJWk/N
	4OP26xFh6QiQtU7tV2Y4EU/Qb//YHN2EyWWN5uGLkpuaMpvw6ThaShQSLYzFuy2K3ulXAn9LTMTXA
	9KzCdrVw==;
Received: from ip6-localhost ([::1]:51830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uf4mA-00BkAZ-TD; Thu, 24 Jul 2025 22:50:58 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42420) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uf4m6-00BkAS-77
 for samba-technical@lists.samba.org; Thu, 24 Jul 2025 22:50:56 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-7071b1facd3so4570096d6.1
 for <samba-technical@lists.samba.org>; Thu, 24 Jul 2025 15:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753397452; x=1754002252; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39cgBMuM/za0y8OMAsLx2omC07JVqPDTO8m8S/8xgkg=;
 b=fwGxbLnq4v0AXwGF3/iSgeD7/ONJSdChI4o4plXJVdmMxe5Bm+ftsOdoNnLcYgnH6U
 ZttSMydpSpZADHwGFIm/1mRBDFW62b302fsJT97WzXXlvw7m9Skv3GhD6bu1m7ap86wT
 HFR8m7eq6eqIACIiNXnrOEkXi1t+oBLQIkYgVdVaSx8wD9mO7CTnlqtjZupHJhbyeK/0
 Aioxe/twuPFT0mff+9iHmPB04FEohY/Qs0bf6/yDV/JfiNAS4veuqv8JW3OedUTcJBDv
 Tz2guUUSCc5nJ/NbeayuRVAahNiBOKQVYwYBc/qbbyIUMQPXwc1RCIJaNgAZsnH4ZSdj
 PYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753397452; x=1754002252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39cgBMuM/za0y8OMAsLx2omC07JVqPDTO8m8S/8xgkg=;
 b=ooRGHphSK3X8tO9pHFaCxCBwyxS1nuSncrLpV3cXtNBfWbsoYSe2GUsigO/NjNwCrl
 spA4xNSOU+PHtYuTOFoems/JlUL1yxySUAS+rIwLmRLzReC+naGkRDhb5Jmbp5VJt5Oa
 2J/pGdEtgxTDMbvBohc9MrCrh+7nkf5kv3SSI1KrhP80OcjCfZLpX3orpml9zJiW7SVB
 BC96uspyKLiZWF2xDL+2IDegRSx6YJlQORLMLaxyKynDiVfCyt3sA09rTV/j1rhUfW8N
 15ZVnpRzrbWSsDlZol0u6SCpyQlqfmhJT2f6YUiylmP+/v9zAwe4wKysGevIbsldGFwF
 rfvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA+1ZMpmE21L8cZyI7ZD2gC8Ev6OdDDWZWNAC2WceHx+Q183Ab9o+y2caBTUnFIKJ2I7oKA33FY4+iVVO+oW4=@lists.samba.org
X-Gm-Message-State: AOJu0Yx1u6DbiqiXMjcUYDD8gpehBSpVmjmaGLVkbJUOvUqVeACsVjcw
 YH3vx612O06abqqUKdQq5VtvZRxGIN70ovdFewJ0Sm193vgyZ6pqkpYTalEHcEYfrM+a+lE+op2
 vzJsg1h7HKuybPNhlT4ewE8iULDgKR3EwY08g
X-Gm-Gg: ASbGncteM4IKD5BcOXf7PnDwWGG9a6xBHeld2ECz0m1q+RnciivOGKM/qvlH1CTmc/i
 QUMCKe+awBgnZAqZFvU2vD/sUKI4kqDWz24fCQjGQAFMx7tVPFwkcjAAiGV+WKVW3D1O2MWOadL
 yizA4gBAfjwhFkCnArBd5v0yv7NWbBKzvmmnEIiJyYY7SfMuMw+bE6IBngOVz7WRd+NALptGBAa
 0rt9DmOA/CIyTaJtyfC+2RVw+QN4yecvLowXvOCuvVMLvgTMlU=
X-Google-Smtp-Source: AGHT+IGJYYkdznCNZK8ndh/JVDvNHuERPApo/thCKR216DGsgLY6vCOQO8HbIixnO0T6K6FhM6sUac0eKpRhaTOEfIo=
X-Received: by 2002:ad4:5aae:0:b0:6fa:a5c9:2ee7 with SMTP id
 6a1803df08f44-70713bb257cmr49626456d6.8.1753397452124; Thu, 24 Jul 2025
 15:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250516152201.201385-1-alxvmr@altlinux.org>
 <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
 <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
 <CAH2r5mtG5pwFMRtu3EeXKPBdq0LJwjt84SbGtL0J4QuCg+AsgQ@mail.gmail.com>
In-Reply-To: <CAH2r5mtG5pwFMRtu3EeXKPBdq0LJwjt84SbGtL0J4QuCg+AsgQ@mail.gmail.com>
Date: Thu, 24 Jul 2025 17:50:40 -0500
X-Gm-Features: Ac12FXxvZFvUMOFz7wEKAPWydtM2qEac4IApoUp3_vJs_WfmFh-SB63Seoe5DXk
Message-ID: <CAH2r5msnTMCHJ9kZmFWCbUUUnejOLv8mzGussaidc3yj3nk+qQ@mail.gmail.com>
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

Maria,
Since this looks like it depends on a cifs-utils change, can you
update your kernel patch with review comments (e.g. changing mount
parm to "dfs_domain_hostname", and there were at least two others in
the thread, e.g. fixing the noisy warning that the patch adds) and
then show the cifs-utils change, so we can make the upcoming merge
window.

On Thu, Jul 24, 2025 at 5:14=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> I will update the mount parm name, similar to what Tom suggested to
> "dfs_domain_hostname" to be less confusing.
>
> Let me know if you had a v2 of the patch with other changes
>
> On Thu, Jul 3, 2025 at 8:00=E2=80=AFAM Maria Alexeeva via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > On 6/14/25 07:42, Vitaly Chikunov wrote:
> > > Maria,
> > >
> > > On Fri, May 16, 2025 at 07:22:01PM +0400, Maria Alexeeva wrote:
> > >> Paths to domain-based dfs resources are defined using the domain nam=
e
> > >> of the server in the format:
> > >> \\DOMAIN.NAME>\<dfsroot>\<path>
> > >>
> > >> The CIFS module, when requesting a TGS, uses the server name
> > >> (<DOMAIN.NAME>) it obtained from the UNC for the initial connection.
> > >> It then composes an SPN that does not match any entities
> > >> in the domain because it is the domain name itself.
> > > For a casual reader like me it's hard to understand (this abbreviatio=
n
> > > filled message) what it's all about. And why we can't just change sys=
tem
> > > hostname for example.
> >
> > This option is needed to transfer the real name of the server to which
> > the connection is taking place,
> > when using the UNC path in the form of domain-based DFS. The system
> > hostname has nothing to do with it.
> >
> > > Also, the summary (subject) message is 180 character which is way abo=
ve
> > > 75 characters suggested in submitting-patches.rst.
> > >
> > >> To eliminate this behavior, a hostname option is added, which is
> > >> the name of the server to connect to and is used in composing the SP=
N.
> > >> In the future this option will be used in the cifs-utils development=
.
> > >>
> > >> Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
> > >> Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
> > >> ---
> > >>   fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++-----=
-
> > >>   fs/smb/client/fs_context.h |  3 +++
> > >>   2 files changed, 32 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> > >> index a634a34d4086..74de0a9de664 100644
> > >> --- a/fs/smb/client/fs_context.c
> > >> +++ b/fs/smb/client/fs_context.c
> > >> @@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_parameter=
s[] =3D {
> > >>      fsparam_string("password2", Opt_pass2),
> > >>      fsparam_string("ip", Opt_ip),
> > >>      fsparam_string("addr", Opt_ip),
> > >> +    fsparam_string("hostname", Opt_hostname),
> > >>      fsparam_string("domain", Opt_domain),
> > >>      fsparam_string("dom", Opt_domain),
> > >>      fsparam_string("srcaddr", Opt_srcaddr),
> > >> @@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs_=
context *fc)
> > >>              return -ENOENT;
> > >>      }
> > >>
> > >> +    if (ctx->got_opt_hostname) {
> > >> +            kfree(ctx->server_hostname);
> > >> +            ctx->server_hostname =3D ctx->opt_hostname;
> > > I am not familiar with the smb codebase but are you sure this will no=
t
> > > cause a race?
> >
> > The race condition will not occur.
> > ctx->server_hostname is also used in smb3_parse_devname inside
> > smb3_fs_context_parse_param.
> > smb3_fs_context_parse_param is called earlier than the updated
> > smb3_fs_context_validate, which is called inside smb3_get_tree:
> >
> > static const struct fs_context_operations smb3_fs_context_ops =3D {
> >   .free   =3D smb3_fs_context_free,
> >   .parse_param  =3D smb3_fs_context_parse_param,
> >   .parse_monolithic =3D smb3_fs_context_parse_monolithic,
> >   .get_tree  =3D smb3_get_tree,
> >   .reconfigure  =3D smb3_reconfigure,
> > };
> >
> > >> +            pr_notice("changing server hostname to name provided in=
 hostname=3D option\n");
> > >> +    }
> > >> +
> > >>      if (!ctx->got_ip) {
> > >>              int len;
> > >> -            const char *slash;
> > >>
> > >> -            /* No ip=3D option specified? Try to get it from UNC */
> > >> -            /* Use the address part of the UNC. */
> > >> -            slash =3D strchr(&ctx->UNC[2], '\\');
> > >> -            len =3D slash - &ctx->UNC[2];
> > >> +            /*
> > >> +             * No ip=3D option specified? Try to get it from server=
_hostname
> > >> +             * Use the address part of the UNC parsed into server_h=
ostname
> > >> +             * or hostname=3D option if specified.
> > >> +             */
> > >> +            len =3D strlen(ctx->server_hostname);
> > >>              if (!cifs_convert_address((struct sockaddr *)&ctx->dsta=
ddr,
> > >> -                                      &ctx->UNC[2], len)) {
> > >> +                                      ctx->server_hostname, len)) {
> > >>                      pr_err("Unable to determine destination address=
\n");
> > >>                      return -EHOSTUNREACH;
> > >>              }
> > >> @@ -1518,6 +1526,21 @@ static int smb3_fs_context_parse_param(struct=
 fs_context *fc,
> > >>              }
> > >>              ctx->got_ip =3D true;
> > >>              break;
> > >> +    case Opt_hostname:
> > >> +            if (strnlen(param->string, CIFS_NI_MAXHOST) =3D=3D CIFS=
_NI_MAXHOST) {
> > >> +                    pr_warn("host name too long\n");
> > >> +                    goto cifs_parse_mount_err;
> > >> +            }
> > >> +
> > >> +            kfree(ctx->opt_hostname);
> > >> +            ctx->opt_hostname =3D kstrdup(param->string, GFP_KERNEL=
);
> > >> +            if (ctx->opt_hostname =3D=3D NULL) {
> > >> +                    cifs_errorf(fc, "OOM when copying hostname stri=
ng\n");
> > >> +                    goto cifs_parse_mount_err;
> > >> +            }
> > >> +            cifs_dbg(FYI, "Host name set\n");
> > >> +            ctx->got_opt_hostname =3D true;
> > >> +            break;
> > >>      case Opt_domain:
> > >>              if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
> > >>                              =3D=3D CIFS_MAX_DOMAINNAME_LEN) {
> > >> diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
> > >> index 9e83302ce4b8..cf0478b1eff9 100644
> > >> --- a/fs/smb/client/fs_context.h
> > >> +++ b/fs/smb/client/fs_context.h
> > >> @@ -184,6 +184,7 @@ enum cifs_param {
> > >>      Opt_pass,
> > >>      Opt_pass2,
> > >>      Opt_ip,
> > >> +    Opt_hostname,
> > >>      Opt_domain,
> > >>      Opt_srcaddr,
> > >>      Opt_iocharset,
> > >> @@ -214,6 +215,7 @@ struct smb3_fs_context {
> > >>      bool gid_specified;
> > >>      bool sloppy;
> > >>      bool got_ip;
> > >> +    bool got_opt_hostname;
> > >>      bool got_version;
> > >>      bool got_rsize;
> > >>      bool got_wsize;
> > >> @@ -226,6 +228,7 @@ struct smb3_fs_context {
> > >>      char *domainname;
> > >>      char *source;
> > >>      char *server_hostname;
> > >> +    char *opt_hostname;
> > > Perhaps, smb3_fs_context_dup and smb3_cleanup_fs_context_contents sho=
uld
> > > be aware of these new fields too.
> >
> > smb3_cleanup_fs_context_contents should be aware of these new fields to=
o.
> >
> > Clearing in smb3_cleanup_fs_context_contents is not necessary, because
> > if opt_hostname !=3D NULL,
> > then the pointer in server_hostname is replaced (it is pre-cleared by
> > kfree), respectively, everything
> > will be cleared by itself with the current code.
> >
> > In smb3_fs_context_dup, opt_hostname does not need to be processed,
> > since this variable is
> > essentially temporary. Immediately after parsing with the parameter, it=
s
> > value goes to
> > server_hostname and it is no longer needed by itself.
> >
> > > Thanks,
> > >
> > >>      char *UNC;
> > >>      char *nodename;
> > >>      char workstation_name[CIFS_MAX_WORKSTATION_LEN];
> > >>
> > >> base-commit: bec6f00f120ea68ba584def5b7416287e7dd29a7
> > >> --
> > >> 2.42.2
> > >>
> >
> > Apologies for the overly long subject line and unclear description.
> > Thanks.
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

