Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E16445D0B
	for <lists+samba-technical@lfdr.de>; Fri,  5 Nov 2021 01:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wZEuh4yzhfx9FkqPNgw6EesObw2HcvTlBnEH/ms4Q28=; b=OSjTTXeU3sCl2CLDMw34c04FMj
	PaR2g1YVfcfq3tYuOCAWMMNgx9Vnqv53L84RkOy4p7oVHc2DhAkdzAy5Cj9zVzb4S7Rjghp8XP6hB
	+AAa42omC1sixaAMmQtByMYMOSaTg1gCEl1SjPMoGP9tm6WtYBgNLC3e8/nqDde5p/GwpROYvATCO
	o9aD+7thdohBiVTMoOxK8orNWsCeSfiu7H1F2CvhRSZwY/KaWuDbfttDacDKRsJsZvw+Yr2mV1JOv
	pSlnjWmodcGLHWH4YoYBhunOEh0fxMNOQY9+YI3Ruh8vHy1nI+hZy3D4sSrEMNHj0aGduhRMjfdiY
	7ptTFAeg==;
Received: from ip6-localhost ([::1]:51266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1min8k-007sYj-Nk; Fri, 05 Nov 2021 00:31:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35469) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1min8d-007sYa-UI
 for samba-technical@lists.samba.org; Fri, 05 Nov 2021 00:31:27 +0000
Received: by mail-ed1-x532.google.com with SMTP id g14so26772901edz.2
 for <samba-technical@lists.samba.org>; Thu, 04 Nov 2021 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wZEuh4yzhfx9FkqPNgw6EesObw2HcvTlBnEH/ms4Q28=;
 b=klKjhwe2Xk57+EPmG+Vb36Q8aNJ0MCgTOOlEcIpmJasCzmbQzaeuXmxhI78Jd9zs4b
 kPnKe2uTgej0brbcJNWEe5zW7uJ88TOq3ovvLtAn6O4mOnFkDDLF59LvAOixeI1LDnfV
 FKwrTl7d0hUhVBUU6iG5UTFE2LbwvbSdZt2WMxdGsnC+mqbp37FSacaqFvn2e+xPvc+p
 PtwElBa3pHfas3WtmhAxrb/kU5A5wQyPqmqisb8ccfCPfDI7pCtf6bv2FtnXuLqn5aCB
 3wydV2I3CpFBUWu4OWnozGIjqIMGP4yKxRUUvhhrCBkyEXTC2JTdyWTg2VTu7h7NN3CR
 5uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wZEuh4yzhfx9FkqPNgw6EesObw2HcvTlBnEH/ms4Q28=;
 b=X8Rcf7WsEhIS2VwdYSf4e1hoL4Qs8H3laQUYbqj4Og5k6WT3He8faSvHsaFv5qBZ2D
 NyupbeRtg1ysgtVj8PJ7pCLJfSieOTswgYDPku6z8Ck4cGJg7qa74CP/pHQNc+2jO9T8
 3ABjmuWL/mVgZa+fvsWS8gSoXhE2skDzV26HYzWrpoEMBF1Fk7/7HDoz/cYuZf8pZI2G
 CI/xca+5T69T3ZdOwjTXLS49KX8AXGLsmXWAVZVQY+d0Ix+wui2sdbqJv+g6SiC2OYFc
 3GrWQVbsu33rVrIIZX36KVtPCcSBn8KDAWsgJv9joARL1RIstg1AWILTPaMqGPQdauc2
 lZlg==
X-Gm-Message-State: AOAM533r77lOycBNAfSCQ7mCKJk3iIDLHhfxMUt1a770dZv4ahPh2NV9
 OPDeCXNWJbkZMECSkdZvotfV9B/DRJpjQ3HoJQ==
X-Google-Smtp-Source: ABdhPJw9TKu2z1hi4L0xkD3Ux4cbdZp94ZgsXo1QAdjbxqJsoP6r/RwoxJxfDAWYlc0RvCu8hUpvITLV83sXyvwQ9eY=
X-Received: by 2002:a17:906:a4e:: with SMTP id
 x14mr65451251ejf.1.1636072282507; 
 Thu, 04 Nov 2021 17:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
 <c49c0a18c228e6aa43dbb2cbab7e0a266d1c0371.camel@redhat.com>
 <CANT5p=p_G+jMMVMkYDL=fXZi_OO7eY2Foz8VkyQuT+1h5Xgifw@mail.gmail.com>
 <facbd0542074a5b8ef2f6f3d5649010503d8d84d.camel@redhat.com>
 <CALe0_75RLR=gcwitnxvACh1mt3jnOGHFx7baO0YRhwEfKwFoGg@mail.gmail.com>
 <CAKywueTUqhathrJmPc7eyNojv1F=199mNcFCENzoQjntK+CAzw@mail.gmail.com>
 <10598d01fe09433ea57a38142b7fb854@atos.net>
 <CALe0_74J8h5F4k2aH2Vh5RvtEtfBZ0nrvE614uM87AuVnWZ+gw@mail.gmail.com>
 <CAKywueSC6azd68E7MHQKtebGL7B=v4Z4O+5tGU3vf3WJbSZgnw@mail.gmail.com>
 <CAGvGhF5rVU1WzLk=aE36n47P357UBOPbsjXE=B8J+feO3bVSSQ@mail.gmail.com>
 <CALe0_77Bv_+v9cdNd_AL5DgA2+EaXMtF_0+rUw6y46fhHq0M4A@mail.gmail.com>
 <CAKywueQU8P-XQsiy4x6B=0YjuwUmTzPVg--SY0sWzGuq6Oy_-w@mail.gmail.com>
 <CALe0_749xeFb6+2XJGuM8=brq_rbqB5LheKbZj17a9bNyn00RQ@mail.gmail.com>
In-Reply-To: <CALe0_749xeFb6+2XJGuM8=brq_rbqB5LheKbZj17a9bNyn00RQ@mail.gmail.com>
Date: Thu, 4 Nov 2021 17:31:10 -0700
Message-ID: <CAKywueSw5u-xzY_QWBgoO5Pp72xZLOvq5FZKFksA+GDtx1+7UQ@mail.gmail.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: Jacob Shivers <jshivers@redhat.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>, "Weiser,
 Michael" <michael.weiser@atos.net>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Leif Sahlberg <lsahlber@redhat.com>, Steve French <smfrench@gmail.com>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>, Simo Sorce <simo@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks everyone for the patches! All 3 have been merged to the next
branch: https://github.com/piastry/cifs-utils/commits/next.

There are no compiler warnings on my system but let me know if you
spot anything.

--
Best regards,
Pavel Shilovsky

=D0=B2=D1=82, 26 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 08:05, Jacob Shive=
rs <jshivers@redhat.com>:
>
> Hello Pavel,
>
> Brief addition to man 8 cifs.upcall
>
> Author: Jacob Shivers <jshivers@redhat.com>
> Date:   Tue Oct 26 10:57:41 2021 -0400
>
>     man-pages: Update cifs.upcall to mention GSS_USE_PROXY
>
>     Add ENVIRONMENT VARIABLES section with the usage of gssproxy as a cre=
dential
>     retrieval method.
>
>     Signed-off-by: Jacob Shivers <jshivers@redhat.com>
>
> diff --git a/cifs.upcall.rst.in b/cifs.upcall.rst.in
> index 08ce324..09d0503 100644
> --- a/cifs.upcall.rst.in
> +++ b/cifs.upcall.rst.in
> @@ -91,6 +91,15 @@ OPTIONS
>  --version|-v
>    Print version number and exit.
>
> +*********************
> +ENVIRONMENT VARIABLES
> +*********************
> +
> +GSS_USE_PROXY=3D"yes"
> +  Enable usage of gssproxy for credential retrieval. This includes keyta=
b
> +  based client initiation as well as (Resource Based) Constrained Delega=
tion.
> +  See gssproxy-mech(8).
> +
>  ************************
>  CONFIGURATION FOR KEYCTL
>  ************************
>
> On Mon, Oct 25, 2021 at 5:32 PM Pavel Shilovsky <piastryyy@gmail.com> wro=
te:
> >
> > Ronnie,
> > Thanks for the patch to silent compile warning. Let me try it.
> >
> > Jacob,
> > Sounds good. I haven't updated the cifs.upcall man page yet. Feel free
> > to provide the patch.
> > --
> > Best regards,
> > Pavel Shilovsky
> >
> > =D0=BF=D1=82, 22 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 19:16, Jacob S=
hivers <jshivers@redhat.com>:
> > >
> > > Everything looks good.
> > >
> > > I sent a PR for gssproxy adding a drop file for cifs-client. I think
> > > the only thing outstanding will be an update to man 8 cifs.upcall tha=
t
> > > mentions the requirement to add GSS_USE_PROXY in
> > > /etc/request-key.d/cifs.spnego. I don't have a particular stance on a
> > > short-hand flag for GSS_USE_PROXY=3Dyes as there is not already an
> > > existing configuration file for client side cifs.ko. Should one ever
> > > be created then it would be pertinent to include it there.
> > >
> > > If you don't have anything written for man 8 cifs.upcall, I can take
> > > care of that.
> > >
> > > Thanks again.
> > >
> > > On Thu, Oct 21, 2021 at 7:46 PM Leif Sahlberg <lsahlber@redhat.com> w=
rote:
> > > >
> > > >
> > > >
> > > >
> > > > On Fri, Oct 22, 2021 at 9:23 AM Pavel Shilovsky <piastryyy@gmail.co=
m> wrote:
> > > >>
> > > >> Hello Michael, Jacob,
> > > >>
> > > >> The cifs.upcall patch is applied with some minor adjustments (code
> > > >> style and a patch description) on top of the next branch on github=
:
> > > >>
> > > >> https://github.com/piastry/cifs-utils/commit/3d681bb5c140376ccc19e=
48711231aeef1e87aa9
> > > >>
> > > >> Please let me know if it looks good and/or if you have other sugge=
stions.
> > > >>
> > > >> The only concern that I have is the compile warning below. Would
> > > >> appreciate it if you provide a fix for that.
> > > >>
> > > >> gcc -DHAVE_CONFIG_H -I.    -Wall -Wextra -D_FORTIFY_SOURCE=3D2 -fp=
ie
> > > >> -pie -Wl,-z,relro,-z,now -g -O2 -MT cifs.upcall.o -MD -MP -MF
> > > >> .deps/cifs.upcall.Tpo -c -o cifs.upcall.o cifs.upcall.c
> > > >> cifs.upcall.c: In function =E2=80=98cifs_gss_get_req=E2=80=99:
> > > >> cifs.upcall.c:808:4: warning: passing argument 5 of
> > > >> =E2=80=98gss_init_sec_context=E2=80=99 discards =E2=80=98const=E2=
=80=99 qualifier from pointer target
> > > >> type [-Wdiscarded-qualifiers]
> > > >>     gss_mech_krb5, /* force krb5 */
> > > >>     ^
> > > >> In file included from /usr/include/gssapi/gssapi_generic.h:31:0,
> > > >>                  from cifs.upcall.c:40:
> > > >> /usr/include/gssapi/gssapi.h:437:1: note: expected =E2=80=98gss_OI=
D {aka
> > > >> struct gss_OID_desc_struct *}=E2=80=99 but argument is of type =E2=
=80=98const
> > > >> gss_OID_desc * const {aka const struct gss_OID_desc_struct * const=
}=E2=80=99
> > > >>  gss_init_sec_context(
> > > >>  ^
> > > >
> > > >
> > > > I do not get that warning on my system, but this patch should fix i=
t?
> > > >
> > > > Author: Ronnie Sahlberg <lsahlber@redhat.com>
> > > > Date:   Fri Oct 22 09:41:24 2021 +1000
> > > >
> > > >     cifs.upcall.c: fix compiler warning
> > > >
> > > >     Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
> > > >
> > > > diff --git a/cifs.upcall.c b/cifs.upcall.c
> > > > index e9c7f5f..5e7c0a1 100644
> > > > --- a/cifs.upcall.c
> > > > +++ b/cifs.upcall.c
> > > > @@ -69,6 +69,10 @@
> > > >  #include <cap-ng.h>
> > > >  #endif
> > > >
> > > > +#ifndef discard_const
> > > > +#define discard_const(ptr) ((void *)((intptr_t)(ptr)))
> > > > +#endif
> > > > +
> > > >  static krb5_context    context;
> > > >  static const char      *prog =3D "cifs.upcall";
> > > >
> > > > @@ -805,7 +809,7 @@ cifs_gss_get_req(const char *host, DATA_BLOB *m=
echtoken, DATA_BLOB *sess_key)
> > > >                         GSS_C_NO_CREDENTIAL, /* claimant_cred_handl=
e */
> > > >                         &ctx,
> > > >                         target_name,
> > > > -                       gss_mech_krb5, /* force krb5 */
> > > > +                       discard_const(gss_mech_krb5), /* force krb5=
 */
> > > >                         0, /* flags */
> > > >                         0, /* time_req */
> > > >                         GSS_C_NO_CHANNEL_BINDINGS, /* input_chan_bi=
ndings */
> > > >
> > > >
> > > >
> > > >>
> > > >> mv -f .deps/cifs.upcall.Tpo .deps/cifs.upcall.Po
> > > >> gcc -Wall -Wextra -D_FORTIFY_SOURCE=3D2 -fpie -pie -Wl,-z,relro,-z=
,now
> > > >> -g -O2   -o cifs.upcall cifs.upcall.o data_blob.o asn1.o spnego.o
> > > >> -ltalloc -lkeyutils -lgssapi_krb5 -lkrb5
> > > >>
> > > >>
> > > >> --
> > > >> Best regards,
> > > >> Pavel Shilovsky
> > > >>
> > > >> =D1=87=D1=82, 30 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 16:=
18, Jacob Shivers <jshivers@redhat.com>:
> > > >>
> > > >> >
> > > >> > Hello Pavel/Michael,
> > > >> >
> > > >> > The only other addition would be to modify
> > > >> > /etc/gssproxy/99-nfs-client.conf to also use the 'program' direc=
tive,
> > > >> > i.e. 'program =3D /usr/sbin/rpc.gssd' so that both rpc.gssd and
> > > >> > cifs.upcall can make use of the default gssproxy socket
> > > >> > '/var/lib/gssproxy/default.sock'
> > > >> >
> > > >> > If the 'program' directive is not included in the respective dro=
p
> > > >> > files, then gssproxy can not differentiate which service is to b=
e used
> > > >> > and will fail to start.
> > > >> >
> > > >> > In total, a gssproxy drop file for cifs.upcall, modifying the gs=
sproxy
> > > >> > drop file for rpc.gssd, and an inclusion of a parameter that set=
s an
> > > >> > environmental variable for cifs.upcall to use gssproxy should be=
 all
> > > >> > that is needed. I had not submitted a pull request for gssproxy =
yet as
> > > >> > the extended cifs.upcall functionality had not received any furt=
her
> > > >> > feedback. I can submit something if you are ready to include the=
 patch
> > > >> > to cifs.upcall
> > > >> >
> > > >> > Thanks,
> > > >> >
> > > >> > Jacob Shivers
> > > >> >
> > > >> > On Mon, Sep 27, 2021 at 3:20 AM Weiser, Michael <michael.weiser@=
atos.net> wrote:
> > > >> > >
> > > >> > > Hello Pavel,
> > > >> > >
> > > >> > > > Do we have any more-up-to-date version of the cifs-utils pat=
ch other
> > > >> > > > than the one attached to the email thread? I would like to m=
erge the
> > > >> > > > patch into the "next" branch so it makes the next release of
> > > >> > > > cifs-utils.
> > > >> > >
> > > >> > > I'm also not aware of a newer version. As one of the initiator=
s of the discussion, who's highly interested in seeing this merged, I'm sta=
nding by to help out with background context, testing or improving the code=
. (The patch was meant as a PoC which is why I skipped some reindenting and=
 niceties to keep its approach and impact easy to gauge.)
> > > >> > >
> > > >> > > > Also there is a potential helper script mentioned above that=
 is needed
> > > >> > > > to set up gssproxy properly?
> > > >> > >
> > > >> > > I'm not aware of a helper script. gssproxy just needs to be to=
ld about cifs-utils and how it should be treated using a single config drop=
 file. Also in the meantime, Jacob and I have streamlined the configuration=
 so a separate UNIX domain socket and tweaking its permissions using a syst=
emd service drop-in file is no longer needed. Instead, gssproxy can disting=
uish multiple clients on the same socket using the calling binary derived f=
rom getsockopt/SO_PEERCRED.
> > > >> > >
> > > >> > > Finally, environment variable GSS_USE_PROXY needs to be set fo=
r cifs.upcall to enable the gssproxy proxy mech. (Instead of using the env =
command, cifs.upcall could have a command line option similar to rpc.gssd[1=
] which ends up doing the same thing.)
> > > >> > >
> > > >> > > Here's the config summary:
> > > >> > >
> > > >> > > # cat /etc/request-key.d/cifs.spnego.conf
> > > >> > > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=3Dyes /=
usr/sbin/cifs.upcall %k
> > > >> > >
> > > >> > > # cat /etc/gssproxy/99-cifs.conf
> > > >> > > [service/cifs]
> > > >> > >   mechs =3D krb5
> > > >> > > # not needed when program option is used
> > > >> > > #  socket =3D /var/lib/gssproxy/cifs.sock
> > > >> > >   program =3D /usr/sbin/cifs.upcall
> > > >> > >   cred_store =3D keytab:/etc/krb5.keytab
> > > >> > >   cred_store =3D ccache:FILE:/var/lib/gssproxy/clients/krb5cc_=
%U
> > > >> > >   cred_store =3D client_keytab:/var/lib/gssproxy/clients/%U.ke=
ytab
> > > >> > >   cred_usage =3D initiate
> > > >> > > # allow process with any euid to use the service and receive i=
mpersonated
> > > >> > > # tickets for services
> > > >> > >   allow_any_uid =3D yes
> > > >> > > # allow euid access to keytab
> > > >> > >   trusted =3D yes
> > > >> > > # allow impersonation
> > > >> > >   impersonate =3D yes
> > > >> > > # allow process with euid 0 to use the keytab
> > > >> > >   euid =3D 0
> > > >> > >
> > > >> > > The actual mount can be done using system credentials from the=
 keytab. Small proof session showcasing that gssproxy is involved and worki=
ng:
> > > >> > >
> > > >> > > # systemctl stop gssproxy
> > > >> > > # mount -o sec=3Dkrb5,multiuser,user=3DFEDORA33\$ //dc/share /=
mnt
> > > >> > > # su - adsuser -c "touch /mnt/test"
> > > >> > > touch: cannot touch '/mnt/test': Permission denied
> > > >> > > # systemctl start gssproxy
> > > >> > > # su - adsuser -c "touch /mnt/test"
> > > >> > > #
> > > >> > >
> > > >> > > [1] http://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dblo=
b;f=3Dutils/gssd/gssd.c;h=3D833d8e0110a9737df8ef6ddeb439ba1a37ee9931;hb=3DH=
EAD#l1128
> > > >> > >
> > > >> > > Thanks,
> > > >> > > Michael
> > > >> > >

