Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9A2AC97D
	for <lists+samba-technical@lfdr.de>; Tue, 10 Nov 2020 00:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AZSH0b3VBG0xAK3qXoidDcxWuYUkrREmytOX8I5+u5w=; b=hjG7arFElmZZKQ9gMjSN7sMW3h
	EX3CrMvhmGPJm6pcQqCHM5CAR4oAMN6RE/+6M4Mf3Ik/MV8KSkvL7JmFHtSNuncf6GV2uJGQPUXFy
	KMgNBYghCRpeGBNkLhcVoGpL4VpwIGea/mph7CHVof3smWNo2g2rmrRVyAPsqlnh7HBIu0CfeOadT
	cTbToyDC73qU08SyaC0Jwk46eiL2U5aPr1CdjLd67kzJwbNM+wmwyU/Jhrvcy48SXXBwO9wShMOwg
	0gxOVOPuj1H+It1H6D5uY9HhOcGPGQLxwIv9SVF5dA+r0B6IPyjKIFCPZoujGvE6kwMxwMRyvGbO8
	X7ySJzpQ==;
Received: from ip6-localhost ([::1]:40942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kcGoP-000Xw9-Ap; Mon, 09 Nov 2020 23:43:01 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:45486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcGoH-000Xw2-F2
 for samba-technical@lists.samba.org; Mon, 09 Nov 2020 23:42:55 +0000
Received: by mail-ej1-x644.google.com with SMTP id dk16so14792422ejb.12
 for <samba-technical@lists.samba.org>; Mon, 09 Nov 2020 15:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AZSH0b3VBG0xAK3qXoidDcxWuYUkrREmytOX8I5+u5w=;
 b=WdiyoSxOKjp2NzTHHiYoFB7N1Ui/YhIehPXz8M6eij3C2NgT8yKlA9mErTFTE0ppw2
 8Eu0jqUaCk3NTlasiYosUH4/uejFjQzHKn1O5V3IvVo08XARtKRoE2W/YBuJ3yJ9RJhv
 QGyYsHSkDzkWbnu0xKOWrAyMheiX1puewiT0FOrYAVmKJRVlEbPFJ+2ZwjPPIkVFo946
 dKxaDFfuYAzeJL13mfDFx3EqrbDvc+eT0Ku0KlDcCdD+SAQ/tHXnTgtjkmX5k2qzRbCB
 Z0OwJCnKt3181VWTfY5ocMZTFuaCB5Sy5SBu0JKPxl+d6x3Ys4x9WbZukmof7Oov4qm4
 DSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AZSH0b3VBG0xAK3qXoidDcxWuYUkrREmytOX8I5+u5w=;
 b=J1/f8fhQP0yKeMtqKxugBBCu4vtJvWddxq1AkY5ZQJbTicgwte9x5uiFtdA+2ANtNb
 h/9cYw7tZ7g7touZe4LapE1ByN6Gzs1FGI66B69o3XxILvys+LWGI+oPWHzrgTuXou1k
 26mV5wVTDMIRPPyll6pctU2tT10y2MvKi0yowYLeVJrNQ1MloIKwjHWlq77UiH4SFhhQ
 599mrWm567xwPWSvEmdLAlj7h3Pzt1UXuZFT9YdWCytuBQEkL4waw3jJ6HvFZXUO8y7v
 F/+48gaaAJipoFZYAhf1vxLFVX0Dc8sV9dTqv4zHBqKZAiIfPxGRu9LJ5Cme34DxDx5m
 gUvw==
X-Gm-Message-State: AOAM531YFJeComd6/d6/WGJiI6GbIHKEOavyFFK5/r3z8t0d+yObCC1X
 MJIn2q8os5LwjmRrF6U8BYxCbuJKj/pDvmAAfQ==
X-Google-Smtp-Source: ABdhPJwfNuwzGtXRT3USWWNJ6GNX3Rjv+B8DZ1U3lQunJ9UZQbFTa02bS0OKOkFtRIn5IumoikndL/v7Deb3MlwTBSY=
X-Received: by 2002:a17:906:4d93:: with SMTP id
 s19mr17942092eju.271.1604965369227; 
 Mon, 09 Nov 2020 15:42:49 -0800 (PST)
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
In-Reply-To: <CANT5p=oTTErJk240GKc+k6Cihqks+9Nnurh=MdrvgC7gqKu1ww@mail.gmail.com>
Date: Mon, 9 Nov 2020 15:42:37 -0800
Message-ID: <CAKywueTr9GHbzg65s12BRKNB_L881wFLmHcb5boFxGX2AoN40g@mail.gmail.com>
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

Merged into next. Please let me know if something needs to be fixed. Thanks=
!
--
Best regards,
Pavel Shilovsky

=D1=87=D1=82, 24 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 03:39, Shyam=
 Prasad N <nspmangalore@gmail.com>:
>
> Hi Aur=C3=A9lien,
>
> I've implemented most of your review comments. Also fixed the issue.
>
> On Wed, Sep 23, 2020 at 7:26 PM Aur=C3=A9lien Aptel <aaptel@suse.com> wro=
te:
> >
> > Shyam Prasad N <nspmangalore@gmail.com> writes:
> > > Also, I'll test this out with DFS once I figure out how to set it up.=
 :)
> > > Re-attaching the patch with some minor changes with just the
> > > "force_pam" mount option.
> >
> > You will need 2 Windows VM. DFS is basically symlinks across
> > servers. The DFS root VM will host the links (standalone namespace) and
> > you have to make them point to shares on the 2nd VM. You don't need to
> > setup replication to test.
> >
> > When you mount the root in cifs.ko and access a link, the server will
> > reply that the file is remote. cifs.ko then does an FSCTL on the link t=
o
> > resolve the target it points to and then connects to the target and
> > mounts it under the link seemlessly.
> >
> >
> > Regarding the patch:
> >
> > * need to update the man page with option and explanation
> >
> > I have some comments with the style, I know it's annoying.. but it
> > would be best to keep the same across the code.
> >
> > * use the existing indent style (tabs) and avoid adding trailing whites=
paces.
> > * no () for return statements
> > * no casting for memory allocation
> > * if (X) free(X)  =3D> free(X)
> >
> > Below some comments about pam_auth_krb5_conv():
> >
> > > @@ -1809,6 +1824,119 @@ get_password(const char *prompt, char *input,=
 int capacity)
> > >       return input;
> > >  }
> > >
> > > +#ifdef HAVE_KRB5PAM
> > > +#define PAM_CIFS_SERVICE "cifs"
> > > +
> > > +static int
> > > +pam_auth_krb5_conv(int n, const struct pam_message **msg,
> > > +    struct pam_response **resp, void *data)
> > > +{
> > > +    struct parsed_mount_info *parsed_info;
> > > +     struct pam_response *reply;
> > > +     int i;
> > > +
> > > +     *resp =3D NULL;
> > > +
> > > +    parsed_info =3D data;
> > > +    if (parsed_info =3D=3D NULL)
> > > +             return (PAM_CONV_ERR);
> > > +     if (n <=3D 0 || n > PAM_MAX_NUM_MSG)
> > > +             return (PAM_CONV_ERR);
> > > +
> > > +     if ((reply =3D calloc(n, sizeof(*reply))) =3D=3D NULL)
> > > +             return (PAM_CONV_ERR);
> > > +
> > > +     for (i =3D 0; i < n; ++i) {
> > > +             switch (msg[i]->msg_style) {
> > > +             case PAM_PROMPT_ECHO_OFF:
> > > +            if ((reply[i].resp =3D (char *) malloc(MOUNT_PASSWD_SIZE=
 + 1)) =3D=3D NULL)
> > > +                goto fail;
> > > +
> > > +            if (parsed_info->got_password && parsed_info->password !=
=3D NULL) {
> > > +                strncpy(reply[i].resp, parsed_info->password, MOUNT_=
PASSWD_SIZE + 1);
> > > +            } else if (get_password(msg[i]->msg, reply[i].resp, MOUN=
T_PASSWD_SIZE + 1) =3D=3D NULL) {
> > > +                goto fail;
> > > +            }
> > > +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> > > +
> > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > +                     break;
> > > +             case PAM_PROMPT_ECHO_ON:
> > > +                     fprintf(stderr, "%s: ", msg[i]->msg);
> > > +            if ((reply[i].resp =3D (char *) malloc(MOUNT_PASSWD_SIZE=
 + 1)) =3D=3D NULL)
> > > +                goto fail;
> > > +
> > > +                     if (fgets(reply[i].resp, MOUNT_PASSWD_SIZE + 1,=
 stdin) =3D=3D NULL)
> >
> > Do we need to remove the trailing \n from the buffer?
> >
> > > +                goto fail;
> > > +
> > > +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> > > +
> > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > +                     break;
> > > +             case PAM_ERROR_MSG:
> >
> > Shouldn't this PAM_ERROR_MSG case goto fail?
> >
> > > +             case PAM_TEXT_INFO:
> > > +                     fprintf(stderr, "%s: ", msg[i]->msg);
> > > +
> > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > +                     break;
> > > +             default:
> > > +                     goto fail;
> > > +             }
> > > +     }
> > > +     *resp =3D reply;
> > > +     return (PAM_SUCCESS);
> > > +
> > > + fail:
> > > +     for(i =3D 0; i < n; i++) {
> > > +        if (reply[i].resp)
> > > +            free(reply[i].resp);
> >
> > free(NULL) is a no-op, remove the checks.
> >
> > > +     }
> > > +     free(reply);
> > > +     return (PAM_CONV_ERR);
> > > +}
> >
> > I gave this a try with a properly configured system joined to AD from
> > local root account:
> >
> > aaptel$ ./configure
> > ...
> > checking krb5.h usability... yes
> > checking krb5.h presence... yes
> > checking for krb5.h... yes
> > checking krb5/krb5.h usability... yes
> > checking krb5/krb5.h presence... yes
> > checking for krb5/krb5.h... yes
> > checking for keyvalue in krb5_keyblock... no
> > ...
> > checking keyutils.h usability... yes
> > checking keyutils.h presence... yes
> > checking for keyutils.h... yes
> > checking for krb5_init_context in -lkrb5... yes
> > ...
> > checking for WBCLIENT... yes
> > checking for wbcSidsToUnixIds in -lwbclient... yes
> > ...
> > checking for keyutils.h... (cached) yes
> > checking security/pam_appl.h usability... yes
> > checking security/pam_appl.h presence... yes
> > checking for security/pam_appl.h... yes
> > checking for pam_start in -lpam... yes
> > checking for security/pam_appl.h... (cached) yes
> > checking for krb5_auth_con_getsendsubkey... yes
> > checking for krb5_principal_get_realm... no
> > checking for krb5_free_unparsed_name... yes
> > checking for krb5_auth_con_setaddrs... yes
> > checking for krb5_auth_con_set_req_cksumtype... yes
> > ...
> > aaptel$ make
> > ....(ok)
> >
> > Without force_pam:
> >
> > root# ./mount.cifs -v //adnuc.nuc.test/data /x -o sec=3Dkrb5,username=
=3Dadministrator,domain=3DNUC
> > mount.cifs kernel mount options: ip=3D192.168.2.111,unc=3D\\adnuc.nuc.t=
est\data,sec=3Dkrb5,user=3Dadministrator,domain=3DNUC
> > mount error(2): No such file or directory
> > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and kernel=
 log messages (dmesg)
> >
> > With force_pam:
> >
> > root# ./mount.cifs -v //adnuc.nuc.test/data /x -o sec=3Dkrb5,username=
=3Dadministrator,domain=3DNUC,force_pam
> > Authenticating as user: administrator
> > Error in authenticating user with PAM: Authentication failure
> > Attempt to authenticate user with PAM unsuccessful. Still, proceeding w=
ith mount.
> >
> > =3D> no further message but mount failed and no msg in dmesg, it didn't
> >    reach the mount() call
> >
> > Not sure what is going on. Does the domain need to be passed to PAM?
> >
> > Cheers,
> > --
> > Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> > GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> > SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnber=
g, DE
> > GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=
=C3=BCnchen)
>
>
>
> --
> -Shyam

