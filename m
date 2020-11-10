Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EEE2AD767
	for <lists+samba-technical@lfdr.de>; Tue, 10 Nov 2020 14:22:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rK3ZZaCEI2LgmFYhCBQqDq8Vn+YrJ4mapojHJV9vb20=; b=jjEROlJRXpr3xWGEtmPIfyDLJx
	/PHoH9u6nXV/9imrHrmin6VClsb5stYU+Z+c14t8p7+ge4U/L2SpLxMINHdEstLqWzLmmICeRnnB3
	PcaUA8SQ0jvjyKFC48u3l5SXo5en59LgEApHbtM1CJpLQ9twOLSSrYFnbMDaqTTtefdwmmPwyM+jb
	C5D/T332yXlklgb2wX0Y1bekJvw777QAvVYztDwfYVJLKXeM+ZgzJEDe7OssbS4hUNxmz9s+CBtAT
	ef2H1z1/OajU6IzwHMXltubTscvgeIjTSX5aFRLJR9B/JCydKrv7mXQQYbgDoU8laQSJXPrhVzUSv
	8WAZJyzQ==;
Received: from ip6-localhost ([::1]:35552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kcTZz-000fyg-2x; Tue, 10 Nov 2020 13:20:59 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcTZs-000fyZ-15
 for samba-technical@lists.samba.org; Tue, 10 Nov 2020 13:20:54 +0000
Received: by mail-yb1-xb33.google.com with SMTP id k65so8120674ybk.5
 for <samba-technical@lists.samba.org>; Tue, 10 Nov 2020 05:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rK3ZZaCEI2LgmFYhCBQqDq8Vn+YrJ4mapojHJV9vb20=;
 b=TeGe/A5sr8z6qaItrksWcnMG6fJA3pcBzwc5qTJFE0w0WMW+DZbvz3Bt6dR8jYtoto
 OgV23ExcAbgU0bQjLf3pIrntqIXH5UfKzYUOhtbq4e2cPaEJwxmb0fifrVdP4v1RxnFS
 dV9fj4e5R/XkoNRAx/lFfI5cjBBr6fDcRgE6zrB1IJFp0pIFnxZs+6JnQZWzv6nM4M+Z
 KiBWfaK8Tzos9OvWMOMSgV0us1iwr60MHWc86iJ4mhBg7oyG+p5xSUnGLBoEVdYzjJSE
 0KEIIyhPbJ55loZkO+E0lTncuUjpsfLnjw6lluioGzHFFU3wS2Oa/X3eoRbD2/QdJ5qe
 Ts6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rK3ZZaCEI2LgmFYhCBQqDq8Vn+YrJ4mapojHJV9vb20=;
 b=r0YzZn+V8PxV39cjeNkcxszDv+yrm0i4DFynQu1uPc6pSBTGzrOEF3iErXnUxd55tt
 g8+w3zM+mlxhI3RVQNclky/KHCSHDFqz3kiPl50OrCdXazYwpMmHZdvEZiZQRYZaOvde
 ehb6iGQfeZ02s3LSoNMAGNtNftq6S77pjRPExbtWcLo2aGbhTYxHk6Kn1gp+stS32UtX
 1WT/6Ck6NgzWtDoMHTAVIqOJTiAK5yRIg7RIyCrrJ8TF82nFllwyAUAorGMlCUUA9pL7
 UVn01lElpLgBdSKaHOYEv760bQaHACMx9E/mCwyquNjYHWTP0Bp64n8IiklFy3crOR7g
 eg7Q==
X-Gm-Message-State: AOAM532He4bxLKihJ5n+e6Tv30/Zr5V24tuPNXgzadscKm23XJAbG4K7
 cFkTRbOioaGequwiUWcorBdn7VTZCpwn78HfGWE=
X-Google-Smtp-Source: ABdhPJz1YZb9e9qssa+ZhLQ3hftd6ZPyWYNhOkeX6Pp3+ShK9AXd+HRIhnoZ1XmduHdfWYFVa+bqH7391UCdAznTZ2A=
X-Received: by 2002:a5b:149:: with SMTP id c9mr11145344ybp.3.1605014447557;
 Tue, 10 Nov 2020 05:20:47 -0800 (PST)
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
In-Reply-To: <CAKywueTr9GHbzg65s12BRKNB_L881wFLmHcb5boFxGX2AoN40g@mail.gmail.com>
Date: Tue, 10 Nov 2020 18:50:37 +0530
Message-ID: <CANT5p=rECwTZgskdXUr3VAHWA-PkYHEXX=qwO8PpVZRc0=pOKA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: Pavel Shilovsky <piastryyy@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Pavel,

There is more that needs to be done on this item. Otherwise, this will
depend on user behaviour to cleanup unused krb5 tickets.
The pending items on this is to propagate this mount option to cifs.ko
and write an umount.cifs utility to read that mount option to do PAM
logoff.
So please rollback this patch for now.

Regards,
Shyam

On Tue, Nov 10, 2020 at 5:12 AM Pavel Shilovsky <piastryyy@gmail.com> wrote=
:
>
> Merged into next. Please let me know if something needs to be fixed. Than=
ks!
> --
> Best regards,
> Pavel Shilovsky
>
> =D1=87=D1=82, 24 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 03:39, Shy=
am Prasad N <nspmangalore@gmail.com>:
> >
> > Hi Aur=C3=A9lien,
> >
> > I've implemented most of your review comments. Also fixed the issue.
> >
> > On Wed, Sep 23, 2020 at 7:26 PM Aur=C3=A9lien Aptel <aaptel@suse.com> w=
rote:
> > >
> > > Shyam Prasad N <nspmangalore@gmail.com> writes:
> > > > Also, I'll test this out with DFS once I figure out how to set it u=
p. :)
> > > > Re-attaching the patch with some minor changes with just the
> > > > "force_pam" mount option.
> > >
> > > You will need 2 Windows VM. DFS is basically symlinks across
> > > servers. The DFS root VM will host the links (standalone namespace) a=
nd
> > > you have to make them point to shares on the 2nd VM. You don't need t=
o
> > > setup replication to test.
> > >
> > > When you mount the root in cifs.ko and access a link, the server will
> > > reply that the file is remote. cifs.ko then does an FSCTL on the link=
 to
> > > resolve the target it points to and then connects to the target and
> > > mounts it under the link seemlessly.
> > >
> > >
> > > Regarding the patch:
> > >
> > > * need to update the man page with option and explanation
> > >
> > > I have some comments with the style, I know it's annoying.. but it
> > > would be best to keep the same across the code.
> > >
> > > * use the existing indent style (tabs) and avoid adding trailing whit=
espaces.
> > > * no () for return statements
> > > * no casting for memory allocation
> > > * if (X) free(X)  =3D> free(X)
> > >
> > > Below some comments about pam_auth_krb5_conv():
> > >
> > > > @@ -1809,6 +1824,119 @@ get_password(const char *prompt, char *inpu=
t, int capacity)
> > > >       return input;
> > > >  }
> > > >
> > > > +#ifdef HAVE_KRB5PAM
> > > > +#define PAM_CIFS_SERVICE "cifs"
> > > > +
> > > > +static int
> > > > +pam_auth_krb5_conv(int n, const struct pam_message **msg,
> > > > +    struct pam_response **resp, void *data)
> > > > +{
> > > > +    struct parsed_mount_info *parsed_info;
> > > > +     struct pam_response *reply;
> > > > +     int i;
> > > > +
> > > > +     *resp =3D NULL;
> > > > +
> > > > +    parsed_info =3D data;
> > > > +    if (parsed_info =3D=3D NULL)
> > > > +             return (PAM_CONV_ERR);
> > > > +     if (n <=3D 0 || n > PAM_MAX_NUM_MSG)
> > > > +             return (PAM_CONV_ERR);
> > > > +
> > > > +     if ((reply =3D calloc(n, sizeof(*reply))) =3D=3D NULL)
> > > > +             return (PAM_CONV_ERR);
> > > > +
> > > > +     for (i =3D 0; i < n; ++i) {
> > > > +             switch (msg[i]->msg_style) {
> > > > +             case PAM_PROMPT_ECHO_OFF:
> > > > +            if ((reply[i].resp =3D (char *) malloc(MOUNT_PASSWD_SI=
ZE + 1)) =3D=3D NULL)
> > > > +                goto fail;
> > > > +
> > > > +            if (parsed_info->got_password && parsed_info->password=
 !=3D NULL) {
> > > > +                strncpy(reply[i].resp, parsed_info->password, MOUN=
T_PASSWD_SIZE + 1);
> > > > +            } else if (get_password(msg[i]->msg, reply[i].resp, MO=
UNT_PASSWD_SIZE + 1) =3D=3D NULL) {
> > > > +                goto fail;
> > > > +            }
> > > > +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> > > > +
> > > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > > +                     break;
> > > > +             case PAM_PROMPT_ECHO_ON:
> > > > +                     fprintf(stderr, "%s: ", msg[i]->msg);
> > > > +            if ((reply[i].resp =3D (char *) malloc(MOUNT_PASSWD_SI=
ZE + 1)) =3D=3D NULL)
> > > > +                goto fail;
> > > > +
> > > > +                     if (fgets(reply[i].resp, MOUNT_PASSWD_SIZE + =
1, stdin) =3D=3D NULL)
> > >
> > > Do we need to remove the trailing \n from the buffer?
> > >
> > > > +                goto fail;
> > > > +
> > > > +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> > > > +
> > > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > > +                     break;
> > > > +             case PAM_ERROR_MSG:
> > >
> > > Shouldn't this PAM_ERROR_MSG case goto fail?
> > >
> > > > +             case PAM_TEXT_INFO:
> > > > +                     fprintf(stderr, "%s: ", msg[i]->msg);
> > > > +
> > > > +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> > > > +                     break;
> > > > +             default:
> > > > +                     goto fail;
> > > > +             }
> > > > +     }
> > > > +     *resp =3D reply;
> > > > +     return (PAM_SUCCESS);
> > > > +
> > > > + fail:
> > > > +     for(i =3D 0; i < n; i++) {
> > > > +        if (reply[i].resp)
> > > > +            free(reply[i].resp);
> > >
> > > free(NULL) is a no-op, remove the checks.
> > >
> > > > +     }
> > > > +     free(reply);
> > > > +     return (PAM_CONV_ERR);
> > > > +}
> > >
> > > I gave this a try with a properly configured system joined to AD from
> > > local root account:
> > >
> > > aaptel$ ./configure
> > > ...
> > > checking krb5.h usability... yes
> > > checking krb5.h presence... yes
> > > checking for krb5.h... yes
> > > checking krb5/krb5.h usability... yes
> > > checking krb5/krb5.h presence... yes
> > > checking for krb5/krb5.h... yes
> > > checking for keyvalue in krb5_keyblock... no
> > > ...
> > > checking keyutils.h usability... yes
> > > checking keyutils.h presence... yes
> > > checking for keyutils.h... yes
> > > checking for krb5_init_context in -lkrb5... yes
> > > ...
> > > checking for WBCLIENT... yes
> > > checking for wbcSidsToUnixIds in -lwbclient... yes
> > > ...
> > > checking for keyutils.h... (cached) yes
> > > checking security/pam_appl.h usability... yes
> > > checking security/pam_appl.h presence... yes
> > > checking for security/pam_appl.h... yes
> > > checking for pam_start in -lpam... yes
> > > checking for security/pam_appl.h... (cached) yes
> > > checking for krb5_auth_con_getsendsubkey... yes
> > > checking for krb5_principal_get_realm... no
> > > checking for krb5_free_unparsed_name... yes
> > > checking for krb5_auth_con_setaddrs... yes
> > > checking for krb5_auth_con_set_req_cksumtype... yes
> > > ...
> > > aaptel$ make
> > > ....(ok)
> > >
> > > Without force_pam:
> > >
> > > root# ./mount.cifs -v //adnuc.nuc.test/data /x -o sec=3Dkrb5,username=
=3Dadministrator,domain=3DNUC
> > > mount.cifs kernel mount options: ip=3D192.168.2.111,unc=3D\\adnuc.nuc=
.test\data,sec=3Dkrb5,user=3Dadministrator,domain=3DNUC
> > > mount error(2): No such file or directory
> > > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and kern=
el log messages (dmesg)
> > >
> > > With force_pam:
> > >
> > > root# ./mount.cifs -v //adnuc.nuc.test/data /x -o sec=3Dkrb5,username=
=3Dadministrator,domain=3DNUC,force_pam
> > > Authenticating as user: administrator
> > > Error in authenticating user with PAM: Authentication failure
> > > Attempt to authenticate user with PAM unsuccessful. Still, proceeding=
 with mount.
> > >
> > > =3D> no further message but mount failed and no msg in dmesg, it didn=
't
> > >    reach the mount() call
> > >
> > > Not sure what is going on. Does the domain need to be passed to PAM?
> > >
> > > Cheers,
> > > --
> > > Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> > > GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> > > SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnb=
erg, DE
> > > GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=
=C3=BCnchen)
> >
> >
> >
> > --
> > -Shyam



--=20
-Shyam

