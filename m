Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7CEB172AA
	for <lists+samba-technical@lfdr.de>; Thu, 31 Jul 2025 16:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vhn9JbqxY6+MlILzyCmjqllaKBii5Z4mUdyeJUwwv9Y=; b=uv1GcSqmn65iLDiLoMu/7y8Y8C
	YcCUMdRlyTUSbYqJoD8zWhB/4+4sYzuKk5nxSl+pOEybgdcfhCazIdpQ8RwMydxL43zkJG2HvIEzf
	UrIzl+Zd0PCXstPi7hVlZsbhf0J8qdzRVCxRwS+/qxPUIzhJ7K6eSVGvZa4N94hV01E9+lt7qsUQv
	r6+hSYMDe2+vmK+WqyzQZEokOPLq12nvxnMPtwF0zxV2keTNubvJ+ydbLsmd2gcKaPD+NlCzqBjUa
	R1EVQ12d5aMBLSiF9cc/BvDhQeTv+OKQzzdEmuVENLt9TtUtZh+pJqfkzcbxBMussHmpYiiq3XqDo
	P1p1/XTQ==;
Received: from ip6-localhost ([::1]:39002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uhTpi-00C6gb-9E; Thu, 31 Jul 2025 14:00:34 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:48603) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uhTpd-00C6gU-76
 for samba-technical@lists.samba.org; Thu, 31 Jul 2025 14:00:31 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-70749d4c5b5so8151836d6.1
 for <samba-technical@lists.samba.org>; Thu, 31 Jul 2025 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753970427; x=1754575227; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vhn9JbqxY6+MlILzyCmjqllaKBii5Z4mUdyeJUwwv9Y=;
 b=RC9mlUyysrQuJhi1zt1c5eSxDy7ziTePCgHsBknTBFMnPpb3dZJxPP1hmd4ELRo3Ub
 5XpFYt9oG1AJ7jxcEkukMpwnhqT4Gnv09ry0tOkx0v9cNBQyAhglLasSX3H9P8Mb13Z3
 vBjoy6tdO+OYPFDg4iMM7SUo36bVP/Uf2YA8aJf6ahkXxe2i4pGzYHd6YJmUllXDqB5N
 QWZ4PKYvJ6VKCseG3RjbeYj38naaKJmjCjelo5S/0j+OqIrSS6deskOPpo+ZTr2qTKu1
 t/Eb+9WFZedSOybgdH3MbKwKB0fQA6fFrXpZa3oH0e+ozhFxSo0A7HRDJCAoIsUi1DQW
 SClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753970427; x=1754575227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vhn9JbqxY6+MlILzyCmjqllaKBii5Z4mUdyeJUwwv9Y=;
 b=GwqTlNL+5bnAL/x/QZK4fz74Pf4XGz95cKmiEpdIBgwkzpOQPGPL8IrNDvoAx8ICln
 MgQtYM5PW1zkDdIi8Yqn7rXhiI1mtYtSbvZs7eG9URJTB2jgGtQ3arb8q6fftLhfYsxL
 LxSThcQX6Z6nsZvpcjAkMSElFbL6/iWffFEs6vFp985zY+s9E/on13k7iZoktVMj4YR4
 e8lfsto1UP4SVPHvKkZ9hedjAnG9KOs6BHBqGugBw5OlmyUNCNir9fdD6d6pWSdYeoGg
 u4LLLu53N+dyKVhCumuoNh7SnIZsghTGYTUHyUWJw9Y5jD2vvk09DOMtbYj7eQMjzZlJ
 zPSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfnXjXh/URQFu3DObhOLCZCzf/bU0IfyU0W0j7RP0PRncHLSzPsuI4V4RBIxK0oeb9KgK+ZQGJUoU5+XDrCog=@lists.samba.org
X-Gm-Message-State: AOJu0Yxecuyz/Pr2yOxxqrYXlli17CkmuY2uDDpOrk1PTgktUS156JY3
 9J4fME2atYC4gN4rEG0qhePR9FjwfCQYxbC7TQWpp3saRchFthM3SxxvdgcZ64d9joxg/7IeIPw
 294p3t7enpb4G375IKMTG6RmzNuOFLJoGEOCkzzI=
X-Gm-Gg: ASbGncsQ0nphOhzfJg5q1HH6BJWSey+9Vicq5qqNZI2CqlygEZhxCrGy9+4+8p8OXQM
 d4GSHnNoVHy9VqWmJ5tuDyaD2xnBetgCQmxwZdjhunYz+MC3XOvm2Jh+VuFevp6O1HnEXE8vSa1
 LtRego1DA9BLb4CPzEIiO+6qeHraln/4cy0qH5iQXKbtxpE06tqmLBzjINAac09D2RWF+hpRLrD
 VuIqb/z4i96OmqqtVaMUI5osDAIb4UYeNFkuRlKxQ==
X-Google-Smtp-Source: AGHT+IHMelhZCjPmtrZE7nkO6WfmoTLROWL+dInzPVyV86zG5qa1vR+amg2JYvs6Kx9j0Vh/uuF57YM9UGpNRaMd7aA=
X-Received: by 2002:ad4:5fcc:0:b0:707:38e8:d10b with SMTP id
 6a1803df08f44-707671e8ed0mr79775066d6.24.1753970425723; Thu, 31 Jul 2025
 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250516152201.201385-1-alxvmr@altlinux.org>
 <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
 <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
 <CAH2r5mtG5pwFMRtu3EeXKPBdq0LJwjt84SbGtL0J4QuCg+AsgQ@mail.gmail.com>
 <CAH2r5msnTMCHJ9kZmFWCbUUUnejOLv8mzGussaidc3yj3nk+qQ@mail.gmail.com>
 <8f2ad82d-0dd4-4195-b414-59f25f859a9e@altlinux.org>
In-Reply-To: <8f2ad82d-0dd4-4195-b414-59f25f859a9e@altlinux.org>
Date: Thu, 31 Jul 2025 09:00:13 -0500
X-Gm-Features: Ac12FXzbyFiRSt3CuGBx5KjwUEGB3A3k_T7XKVkBoWzhj1t2v-Gao59X1XFhkms
Message-ID: <CAH2r5mvDa8E8NKNHevoWYARY_52DJ+WQX3oetYw-pwysMyAKYQ@mail.gmail.com>
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
 Tom Talpey <tom@talpey.com>, Vitaly Chikunov <vt@altlinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I don't have any strong opinion on: "dfs_server_hostname" vs
"dfs_domain_hostname" whichever makes more sense.

I will look to see if I can find any more threads on this in earlier email

On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Maria Alexeeva <alxvmr@altlinux.or=
g> wrote:
>
> Steve,
> It seems some of the discussion with review comments fell outside this
> thread (I can only find vt@altlinux.org Vitaly Chikunov's remarks).
> Could you please point me to where the rest of the feedback can be
> found (e.g., about fixing the noisy warning the patch adds and
> other comments)?
>
> An updated patch for fs/smb/client/fs_context has been prepared, renaming
> the option to dfs_domain_hostname. There's suggestion to further rename
> it to dfs_server_hostname - what are your thoughts on this?
>
> The patches will follow in subsequent messages.
>
> Thanks!
>
> On 7/25/25 02:50, Steve French via samba-technical wrote:
> > Maria,
> > Since this looks like it depends on a cifs-utils change, can you
> > update your kernel patch with review comments (e.g. changing mount
> > parm to "dfs_domain_hostname", and there were at least two others in
> > the thread, e.g. fixing the noisy warning that the patch adds) and
> > then show the cifs-utils change, so we can make the upcoming merge
> > window.
> >
> > On Thu, Jul 24, 2025 at 5:14=E2=80=AFPM Steve French <smfrench@gmail.co=
m> wrote:
> >>
> >> I will update the mount parm name, similar to what Tom suggested to
> >> "dfs_domain_hostname" to be less confusing.
> >>
> >> Let me know if you had a v2 of the patch with other changes
> >>
> >> On Thu, Jul 3, 2025 at 8:00=E2=80=AFAM Maria Alexeeva via samba-techni=
cal
> >> <samba-technical@lists.samba.org> wrote:
> >>>
> >>> On 6/14/25 07:42, Vitaly Chikunov wrote:
> >>>> Maria,
> >>>>
> >>>> On Fri, May 16, 2025 at 07:22:01PM +0400, Maria Alexeeva wrote:
> >>>>> Paths to domain-based dfs resources are defined using the domain na=
me
> >>>>> of the server in the format:
> >>>>> \\DOMAIN.NAME>\<dfsroot>\<path>
> >>>>>
> >>>>> The CIFS module, when requesting a TGS, uses the server name
> >>>>> (<DOMAIN.NAME>) it obtained from the UNC for the initial connection=
.
> >>>>> It then composes an SPN that does not match any entities
> >>>>> in the domain because it is the domain name itself.
> >>>> For a casual reader like me it's hard to understand (this abbreviati=
on
> >>>> filled message) what it's all about. And why we can't just change sy=
stem
> >>>> hostname for example.
> >>>
> >>> This option is needed to transfer the real name of the server to whic=
h
> >>> the connection is taking place,
> >>> when using the UNC path in the form of domain-based DFS. The system
> >>> hostname has nothing to do with it.
> >>>
> >>>> Also, the summary (subject) message is 180 character which is way ab=
ove
> >>>> 75 characters suggested in submitting-patches.rst.
> >>>>
> >>>>> To eliminate this behavior, a hostname option is added, which is
> >>>>> the name of the server to connect to and is used in composing the S=
PN.
> >>>>> In the future this option will be used in the cifs-utils developmen=
t.
> >>>>>
> >>>>> Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
> >>>>> Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
> >>>>> ---
> >>>>>    fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++---=
---
> >>>>>    fs/smb/client/fs_context.h |  3 +++
> >>>>>    2 files changed, 32 insertions(+), 6 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.=
c
> >>>>> index a634a34d4086..74de0a9de664 100644
> >>>>> --- a/fs/smb/client/fs_context.c
> >>>>> +++ b/fs/smb/client/fs_context.c
> >>>>> @@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_paramete=
rs[] =3D {
> >>>>>       fsparam_string("password2", Opt_pass2),
> >>>>>       fsparam_string("ip", Opt_ip),
> >>>>>       fsparam_string("addr", Opt_ip),
> >>>>> +    fsparam_string("hostname", Opt_hostname),
> >>>>>       fsparam_string("domain", Opt_domain),
> >>>>>       fsparam_string("dom", Opt_domain),
> >>>>>       fsparam_string("srcaddr", Opt_srcaddr),
> >>>>> @@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs=
_context *fc)
> >>>>>               return -ENOENT;
> >>>>>       }
> >>>>>
> >>>>> +    if (ctx->got_opt_hostname) {
> >>>>> +            kfree(ctx->server_hostname);
> >>>>> +            ctx->server_hostname =3D ctx->opt_hostname;
> >>>> I am not familiar with the smb codebase but are you sure this will n=
ot
> >>>> cause a race?
> >>>
> >>> The race condition will not occur.
> >>> ctx->server_hostname is also used in smb3_parse_devname inside
> >>> smb3_fs_context_parse_param.
> >>> smb3_fs_context_parse_param is called earlier than the updated
> >>> smb3_fs_context_validate, which is called inside smb3_get_tree:
> >>>
> >>> static const struct fs_context_operations smb3_fs_context_ops =3D {
> >>>    .free   =3D smb3_fs_context_free,
> >>>    .parse_param  =3D smb3_fs_context_parse_param,
> >>>    .parse_monolithic =3D smb3_fs_context_parse_monolithic,
> >>>    .get_tree  =3D smb3_get_tree,
> >>>    .reconfigure  =3D smb3_reconfigure,
> >>> };
> >>>
> >>>>> +            pr_notice("changing server hostname to name provided i=
n hostname=3D option\n");
> >>>>> +    }
> >>>>> +
> >>>>>       if (!ctx->got_ip) {
> >>>>>               int len;
> >>>>> -            const char *slash;
> >>>>>
> >>>>> -            /* No ip=3D option specified? Try to get it from UNC *=
/
> >>>>> -            /* Use the address part of the UNC. */
> >>>>> -            slash =3D strchr(&ctx->UNC[2], '\\');
> >>>>> -            len =3D slash - &ctx->UNC[2];
> >>>>> +            /*
> >>>>> +             * No ip=3D option specified? Try to get it from serve=
r_hostname
> >>>>> +             * Use the address part of the UNC parsed into server_=
hostname
> >>>>> +             * or hostname=3D option if specified.
> >>>>> +             */
> >>>>> +            len =3D strlen(ctx->server_hostname);
> >>>>>               if (!cifs_convert_address((struct sockaddr *)&ctx->ds=
taddr,
> >>>>> -                                      &ctx->UNC[2], len)) {
> >>>>> +                                      ctx->server_hostname, len)) =
{
> >>>>>                       pr_err("Unable to determine destination addre=
ss\n");
> >>>>>                       return -EHOSTUNREACH;
> >>>>>               }
> >>>>> @@ -1518,6 +1526,21 @@ static int smb3_fs_context_parse_param(struc=
t fs_context *fc,
> >>>>>               }
> >>>>>               ctx->got_ip =3D true;
> >>>>>               break;
> >>>>> +    case Opt_hostname:
> >>>>> +            if (strnlen(param->string, CIFS_NI_MAXHOST) =3D=3D CIF=
S_NI_MAXHOST) {
> >>>>> +                    pr_warn("host name too long\n");
> >>>>> +                    goto cifs_parse_mount_err;
> >>>>> +            }
> >>>>> +
> >>>>> +            kfree(ctx->opt_hostname);
> >>>>> +            ctx->opt_hostname =3D kstrdup(param->string, GFP_KERNE=
L);
> >>>>> +            if (ctx->opt_hostname =3D=3D NULL) {
> >>>>> +                    cifs_errorf(fc, "OOM when copying hostname str=
ing\n");
> >>>>> +                    goto cifs_parse_mount_err;
> >>>>> +            }
> >>>>> +            cifs_dbg(FYI, "Host name set\n");
> >>>>> +            ctx->got_opt_hostname =3D true;
> >>>>> +            break;
> >>>>>       case Opt_domain:
> >>>>>               if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
> >>>>>                               =3D=3D CIFS_MAX_DOMAINNAME_LEN) {
> >>>>> diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.=
h
> >>>>> index 9e83302ce4b8..cf0478b1eff9 100644
> >>>>> --- a/fs/smb/client/fs_context.h
> >>>>> +++ b/fs/smb/client/fs_context.h
> >>>>> @@ -184,6 +184,7 @@ enum cifs_param {
> >>>>>       Opt_pass,
> >>>>>       Opt_pass2,
> >>>>>       Opt_ip,
> >>>>> +    Opt_hostname,
> >>>>>       Opt_domain,
> >>>>>       Opt_srcaddr,
> >>>>>       Opt_iocharset,
> >>>>> @@ -214,6 +215,7 @@ struct smb3_fs_context {
> >>>>>       bool gid_specified;
> >>>>>       bool sloppy;
> >>>>>       bool got_ip;
> >>>>> +    bool got_opt_hostname;
> >>>>>       bool got_version;
> >>>>>       bool got_rsize;
> >>>>>       bool got_wsize;
> >>>>> @@ -226,6 +228,7 @@ struct smb3_fs_context {
> >>>>>       char *domainname;
> >>>>>       char *source;
> >>>>>       char *server_hostname;
> >>>>> +    char *opt_hostname;
> >>>> Perhaps, smb3_fs_context_dup and smb3_cleanup_fs_context_contents sh=
ould
> >>>> be aware of these new fields too.
> >>>
> >>> smb3_cleanup_fs_context_contents should be aware of these new fields =
too.
> >>>
> >>> Clearing in smb3_cleanup_fs_context_contents is not necessary, becaus=
e
> >>> if opt_hostname !=3D NULL,
> >>> then the pointer in server_hostname is replaced (it is pre-cleared by
> >>> kfree), respectively, everything
> >>> will be cleared by itself with the current code.
> >>>
> >>> In smb3_fs_context_dup, opt_hostname does not need to be processed,
> >>> since this variable is
> >>> essentially temporary. Immediately after parsing with the parameter, =
its
> >>> value goes to
> >>> server_hostname and it is no longer needed by itself.
> >>>
> >>>> Thanks,
> >>>>
> >>>>>       char *UNC;
> >>>>>       char *nodename;
> >>>>>       char workstation_name[CIFS_MAX_WORKSTATION_LEN];
> >>>>>
> >>>>> base-commit: bec6f00f120ea68ba584def5b7416287e7dd29a7
> >>>>> --
> >>>>> 2.42.2
> >>>>>
> >>>
> >>> Apologies for the overly long subject line and unclear description.
> >>> Thanks.
> >>>
> >>
> >>
> >> --
> >> Thanks,
> >>
> >> Steve
> >
> >
> >
>


--=20
Thanks,

Steve

