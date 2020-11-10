Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AFE2ADF35
	for <lists+samba-technical@lfdr.de>; Tue, 10 Nov 2020 20:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PJ4DOzC41mYmT3Atp4TBIlzeuBVQgq04r1ebxOTKKA0=; b=1bV3VYB/rFP+8Gwch5yYWZtniB
	T2I48wtf4R1VcOK5hKoE+pJkEaCbIasPXwAMCaQPn3CgGSNSQ2nE4JblqVXPsba4psfJ01ig1+4Mm
	gsLOM2D4ttPr/k0FujMOdJbHcq2qEm0VySyVfuE9sTmwQcjztfBIxaT63KB8kWy5QPrv+tbpyK6sn
	lAItnDq38cMiurud1L7SFljx+WKUAGEFOTnWVN02AdjdltZ6v6G3uoeat8g0G43eX32FtdffAY+AP
	IOS8+J5veU1z1Z2OfwNv+NCmb7NIt8I45JE2OTxiXNPlPxNDINDu4bAXJG7Hq6VP7ZL8SpI7BEU2u
	LxwCIBjg==;
Received: from ip6-localhost ([::1]:63536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kcZEX-000kmN-VQ; Tue, 10 Nov 2020 19:23:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37595) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcZER-000kmG-8S
 for samba-technical@lists.samba.org; Tue, 10 Nov 2020 19:23:09 +0000
Received: by mail-ej1-x635.google.com with SMTP id f20so7714797ejz.4
 for <samba-technical@lists.samba.org>; Tue, 10 Nov 2020 11:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PJ4DOzC41mYmT3Atp4TBIlzeuBVQgq04r1ebxOTKKA0=;
 b=X+ehmXz4b1oYXLkKWR3zMqY5GRmhbSd8d+uY4tizfFQ7aXgHyDyHvrsyYdQFTpthES
 99IEuxcFfLIdi11oYsVYV0wkAswcI/wSwAl7VDBNtko45iL2f1oQyIs4vmBrP1VAbq+i
 dojHAxM8iX2mtbzEWsasOgN2iPmtPOM5s+hJ/qeQuGAU3iQgIwtwnMKFzzt3xudTJHIY
 JSYG1LLtbaqk0Bj4wB1EcybVkKpQNa6J+1pTSklacoGJId33c+mS8cVlHsU2wQPhUkMw
 9ESLJlRMfBZc6NurYL1twkuWhrqwT4OBcaTuM114UFEJ/tAZJat7iXnUxolScyzi30oF
 s0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PJ4DOzC41mYmT3Atp4TBIlzeuBVQgq04r1ebxOTKKA0=;
 b=CXXU8j4TSdk94oMWYURYVXfXr/aOjb0qiOppCj2Nf35YnlVIq3cRzSO9tVRteCzqlI
 xVzT+5mHY5ot7q6JDj5mobk9kFZmrRBeRwwFUSYLjdpTPonYmctMZjw97DIMuZedpXI/
 rEjrSGNI2sFOMUD0Mdot4mvpIWBRgLnX8+iSQ2VtEIVwgGLjoP0dkmtsPXIljn7UFsUf
 V03RxrAGdVtzCep9UsegahUoWKirPVA/Li+29aaU4N3U82NWrdDwrYvaRj95rDHtnbf6
 C5+zuR3ej2h0RxTqXqhm5V1jo1FWsHV5244WT89KCV8RvO215BGXP1jTFxM55yn/mTRP
 TqEg==
X-Gm-Message-State: AOAM532Np7R5N94jfx8hLaxn+RB/d6OpoEvRGbNgTDvtvuMfTTbTA1Q4
 mdvqiV17fAnLuRRsXGsvEs2rur78S0MRhxU1tQ==
X-Google-Smtp-Source: ABdhPJzVkurpwu1+F6lHmwdl+k+/HbhPWTP7msk35esU/pGbx06BOXluahn4RKWi7VkMhnzsHOBfKWwUAhdzyzg6E4s=
X-Received: by 2002:a17:906:1183:: with SMTP id
 n3mr21215856eja.188.1605036185811; 
 Tue, 10 Nov 2020 11:23:05 -0800 (PST)
MIME-Version: 1.0
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
 <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
 <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
 <874ko7vy0z.fsf@suse.com>
 <CANT5p=o07RqmMkcFoLeUVTeQHhzh5MmFYpfAdv0755iiGbp1ZA@mail.gmail.com>
 <87mu1yc6gw.fsf@suse.com>
 <CANT5p=r0Jix9EuuF8gJzQBGHLp0Y-Oogxzju7_2cJog_jF2fjg@mail.gmail.com>
 <874knolhpw.fsf@suse.com>
 <CANT5p=oTTErJk240GKc+k6Cihqks+9Nnurh=MdrvgC7gqKu1ww@mail.gmail.com>
 <CAKywueTr9GHbzg65s12BRKNB_L881wFLmHcb5boFxGX2AoN40g@mail.gmail.com>
 <CANT5p=rECwTZgskdXUr3VAHWA-PkYHEXX=qwO8PpVZRc0=pOKA@mail.gmail.com>
In-Reply-To: <CANT5p=rECwTZgskdXUr3VAHWA-PkYHEXX=qwO8PpVZRc0=pOKA@mail.gmail.com>
Date: Tue, 10 Nov 2020 11:22:54 -0800
Message-ID: <CAKywueTuGuqT8QN-8Jn1QNHT+HPKysLDhdp1gPsm6+Q0tQnbGA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: Shyam Prasad N <nspmangalore@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sure. Removed the patch and updated the next branch.
--
Best regards,
Pavel Shilovsky

=D0=B2=D1=82, 10 =D0=BD=D0=BE=D1=8F=D0=B1. 2020 =D0=B3. =D0=B2 05:20, Shyam=
 Prasad N <nspmangalore@gmail.com>:
>
> Hi Pavel,
>
> There is more that needs to be done on this item. Otherwise, this will
> depend on user behaviour to cleanup unused krb5 tickets.
> The pending items on this is to propagate this mount option to cifs.ko
> and write an umount.cifs utility to read that mount option to do PAM
> logoff.
> So please rollback this patch for now.
>
> Regards,
> Shyam
>
> On Tue, Nov 10, 2020 at 5:12 AM Pavel Shilovsky <piastryyy@gmail.com> wro=
te:
> >
> > Merged into next. Please let me know if something needs to be fixed. Th=
anks!
> > --
> > Best regards,
> > Pavel Shilovsky
> >
> > =D1=87=D1=82, 24 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 03:39, S=
hyam Prasad N <nspmangalore@gmail.com>:
> > >
> > > Hi Aur=C3=A9lien,
> > >
> > > I've implemented most of your review comments. Also fixed the issue.
> > >
> > > On Wed, Sep 23, 2020 at 7:26 PM Aur=C3=A9lien Aptel <aaptel@suse.com>=
 wrote:
> > > >
> > > > Shyam Prasad N <nspmangalore@gmail.com> writes:
> > > > > Also, I'll test this out with DFS once I figure out how to set it=
 up. :)
> > > > > Re-attaching the patch with some minor changes with just the
> > > > > "force_pam" mount option.
> > > >
> > > > You will need 2 Windows VM. DFS is basically symlinks across
> > > > servers. The DFS root VM will host the links (standalone namespace)=
 and
> > > > you have to make them point to shares on the 2nd VM. You don't need=
 to
> > > > setup replication to test.
> > > >
> > > > When you mount the root in cifs.ko and access a link, the server wi=
ll
> > > > reply that the file is remote. cifs.ko then does an FSCTL on the li=
nk to
> > > > resolve the target it points to and then connects to the target and
> > > > mounts it under the link seemlessly.
> > > >
> > > >
> > > > Regarding the patch:
> > > >
> > > > * need to update the man page with option and explanation
> > > >
> > > > I have some comments with the style, I know it's annoying.. but it
> > > > would be best to keep the same across the code.
> > > >
> > > > * use the existing indent style (tabs) and avoid adding trailing wh=
itespaces.
> > > > * no () for return statements
> > > > * no casting for memory allocation
> > > > * if (X) free(X)  =3D> free(X)
> > > >
> > > > Below some comments about pam_auth_krb5_conv():
> > > >
> > > > > @@ -1809,6 +1824,119 @@ get_password(const char *prompt, char *in=
put, int capacity)
> > > > >       return input;
> > > > >  }
> > > > >
> > > > > +#ifdef HAVE_KRB5PAM
> > > > > +#define PAM_CIFS_SERVICE "cifs"
> > > > > +
> > > > > +static int
> > > > > +pam_auth_krb5_conv(int n, const struct pam_message **msg,
> > > > > +    struct pam_response **resp, void *data)
> > > > > +{
> > > > > +    struct parsed_mount_info *parsed_info;
> > > > > +     struct pam_response *reply;
> > > > > +     int i;
> > > > > +
> > > > > +     *resp =3D NULL;
> > > > > +
> > > > > +    parsed_info =3D data;
> > > > > +    if (parsed_info =3D=3D NULL)
> > > > > +             return (PAM_CONV_ERR);
> > > > > +     if (n <=3D 0 || n > PAM_MAX_NUM_MSG)
> > > > > +             return (PAM_CONV_ERR);
> > > > > +
> > > > > +     if ((reply =3D calloc(n, sizeof(*reply))) =3D=3D NULL)
> > > > > +             return (PAM_CONV_ERR);
> > > > > +
> > > > > +     for (i =3D 0; i < n; ++i) {
> > > > > +             switch (msg[i]->msg_style) {
> > > > > +             case PAM_PROMPT_ECHO_OFF:
> > > > > +            if ((reply[i].resp =3D (char *) malloc(MOUNT_PASSWD_=
SIZE + 1)) =3D=3D NULL)
> > > > > +                goto fail;
> > > > > +
> > > > > +            if (parsed_info->got_password && parsed_info->passwo=
rd !=3D NULL) {
> > > > > +                strncpy(reply[i].resp, parsed_info->password, MO=
UNT_PASSWD_SIZE + 1);
> > > > > +            } else if (get_password(msg[i]->msg, reply[i].resp, =
MOUNT_PASSWD_SIZE + 1) =3D=3D NULL) {
> > > > > +                goto fail;
> > > > > +            }
> > > > > +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> > > > > +
> > > > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > > > +                     break;
> > > > > +             case PAM_PROMPT_ECHO_ON:
> > > > > +                     fprintf(stderr, "%s: ", msg[i]->msg);
> > > > > +            if ((reply[i].resp =3D (char *) malloc(MOUNT_PASSWD_=
SIZE + 1)) =3D=3D NULL)
> > > > > +                goto fail;
> > > > > +
> > > > > +                     if (fgets(reply[i].resp, MOUNT_PASSWD_SIZE =
+ 1, stdin) =3D=3D NULL)
> > > >
> > > > Do we need to remove the trailing \n from the buffer?
> > > >
> > > > > +                goto fail;
> > > > > +
> > > > > +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> > > > > +
> > > > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > > > +                     break;
> > > > > +             case PAM_ERROR_MSG:
> > > >
> > > > Shouldn't this PAM_ERROR_MSG case goto fail?
> > > >
> > > > > +             case PAM_TEXT_INFO:
> > > > > +                     fprintf(stderr, "%s: ", msg[i]->msg);
> > > > > +
> > > > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > > > +                     break;
> > > > > +             default:
> > > > > +                     goto fail;
> > > > > +             }
> > > > > +     }
> > > > > +     *resp =3D reply;
> > > > > +     return (PAM_SUCCESS);
> > > > > +
> > > > > + fail:
> > > > > +     for(i =3D 0; i < n; i++) {
> > > > > +        if (reply[i].resp)
> > > > > +            free(reply[i].resp);
> > > >
> > > > free(NULL) is a no-op, remove the checks.
> > > >
> > > > > +     }
> > > > > +     free(reply);
> > > > > +     return (PAM_CONV_ERR);
> > > > > +}
> > > >
> > > > I gave this a try with a properly configured system joined to AD fr=
om
> > > > local root account:
> > > >
> > > > aaptel$ ./configure
> > > > ...
> > > > checking krb5.h usability... yes
> > > > checking krb5.h presence... yes
> > > > checking for krb5.h... yes
> > > > checking krb5/krb5.h usability... yes
> > > > checking krb5/krb5.h presence... yes
> > > > checking for krb5/krb5.h... yes
> > > > checking for keyvalue in krb5_keyblock... no
> > > > ...
> > > > checking keyutils.h usability... yes
> > > > checking keyutils.h presence... yes
> > > > checking for keyutils.h... yes
> > > > checking for krb5_init_context in -lkrb5... yes
> > > > ...
> > > > checking for WBCLIENT... yes
> > > > checking for wbcSidsToUnixIds in -lwbclient... yes
> > > > ...
> > > > checking for keyutils.h... (cached) yes
> > > > checking security/pam_appl.h usability... yes
> > > > checking security/pam_appl.h presence... yes
> > > > checking for security/pam_appl.h... yes
> > > > checking for pam_start in -lpam... yes
> > > > checking for security/pam_appl.h... (cached) yes
> > > > checking for krb5_auth_con_getsendsubkey... yes
> > > > checking for krb5_principal_get_realm... no
> > > > checking for krb5_free_unparsed_name... yes
> > > > checking for krb5_auth_con_setaddrs... yes
> > > > checking for krb5_auth_con_set_req_cksumtype... yes
> > > > ...
> > > > aaptel$ make
> > > > ....(ok)
> > > >
> > > > Without force_pam:
> > > >
> > > > root# ./mount.cifs -v //adnuc.nuc.test/data /x -o sec=3Dkrb5,userna=
me=3Dadministrator,domain=3DNUC
> > > > mount.cifs kernel mount options: ip=3D192.168.2.111,unc=3D\\adnuc.n=
uc.test\data,sec=3Dkrb5,user=3Dadministrator,domain=3DNUC
> > > > mount error(2): No such file or directory
> > > > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and ke=
rnel log messages (dmesg)
> > > >
> > > > With force_pam:
> > > >
> > > > root# ./mount.cifs -v //adnuc.nuc.test/data /x -o sec=3Dkrb5,userna=
me=3Dadministrator,domain=3DNUC,force_pam
> > > > Authenticating as user: administrator
> > > > Error in authenticating user with PAM: Authentication failure
> > > > Attempt to authenticate user with PAM unsuccessful. Still, proceedi=
ng with mount.
> > > >
> > > > =3D> no further message but mount failed and no msg in dmesg, it di=
dn't
> > > >    reach the mount() call
> > > >
> > > > Not sure what is going on. Does the domain need to be passed to PAM=
?
> > > >
> > > > Cheers,
> > > > --
> > > > Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> > > > GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> > > > SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCr=
nberg, DE
> > > > GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG=
 M=C3=BCnchen)
> > >
> > >
> > >
> > > --
> > > -Shyam
>
>
>
> --
> -Shyam

