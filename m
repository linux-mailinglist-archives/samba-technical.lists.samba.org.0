Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE962DCA48
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 02:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4n7XUE5qRo6QjQ2wmZn1T9AY0m+Za4KZNPq89U0r6/U=; b=nW58550ntpzrE4n10q1ac7umJg
	zvNDCHjKJ2sFvFBZnOXHAIwFF3vyHUsS0yJRuxtUA9NqoU7o2KwGBGEe8q2E+WeTlCDEJFAuq2R5z
	Ky6cdq0PGu/d8O1tu+G9KvnGxXpvj4793HUlFb3iVpTmLzbtCDNtKa/DTJ27UG1Y8QLYumuDfTTLK
	nkLXnE4LgbYuIgG8mEzF51rwfzh0Q2HCsAtRAB5/Jj3CGw4zRJ3SXD3ZMqF5ubGKisi9dx4mwcbBq
	el/8lyjrbFcd2TGdKeYFXxambx00Ny58fmxc1GYOFBeL8AGbZ9uwz/HCdYbxhRrvTkoPori/7zsic
	KWT5rJMA==;
Received: from ip6-localhost ([::1]:55066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kphjT-001kHB-2C; Thu, 17 Dec 2020 01:05:27 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44380) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kphjG-001kH3-Vt
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 01:05:22 +0000
Received: by mail-yb1-xb34.google.com with SMTP id x2so24272877ybt.11
 for <samba-technical@lists.samba.org>; Wed, 16 Dec 2020 17:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tzDVhoFV2S5dvM/YF1SQmj0YBVY/s73sTSzsZZROwrI=;
 b=WQhtU1fvrRUPB3S1nUYOakHER2CqLxgCF0m9hn3AwkJVCh0RmDnkdlq6jOPc1ZcVVv
 6R9rUucnKWxAWlW1np9eGWhxTlDpZDUjWwK1EZKVa9WIhcn/XbcIETRnCqHF3gEPW4kc
 u/zRfl8gcu27BiKs+x2sqDKFtQ1jewg+AypLFX0eHSOH1CSVoGA8R0F02gXgj6+Ptya4
 1ubXmKMmII3e788wuhL2DhPB25XmWBk67dYObhp+Qv4tkeMzdqxEShSZDDSTowy4zXfV
 4d9O7ICRZ8q1oLYP/T88dZGtEYHm3Hs1YjgS4LkYnQMcNkbkA762qEjRGFGMdMphP8+3
 0uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tzDVhoFV2S5dvM/YF1SQmj0YBVY/s73sTSzsZZROwrI=;
 b=VRuzR/JlBb+SK8K9V6mBV4xkQBsQIX2zs6whB/1EBfaq1RHLRJd9v2DT+pLjfruCxM
 9A7d3IR6FIEcj6ZyuvWINZatL7m+Z27VfBLMMsZFvB3qX+uYrk3gd0q6v2tuBQwTSSXo
 FU9c40nk80QlhERe8Svysp2iQNtFwHlno3dsvR60Adz1iEZihyyokDyqVTUTfNFWFvlq
 7I/VhB5045oRhpSocRLGbhppSVLWy4DayfWIJ1EAQ7uFJLZ0U7brzyrqfzJ/JNSVF+c/
 JTEBRZgUihzr96U+IBWui2kKguQLqjg3qdmz5VtqgKTRJ5GxerzzLWNYg7A1fZ+jZdTA
 vcjw==
X-Gm-Message-State: AOAM531YgXjf3815skWQR0pDno6djbBNSq38ol2exRR0o/4uZ+GZS4mn
 BdBoWC+xRJbMPsOzMVyyyrX6vp1aGjplbhkXNVDGtxUv
X-Google-Smtp-Source: ABdhPJyrdObXHyCfpE5KjhchNsWeIohZd7ZbNmgyHCQY9/w+q/U2AF88h3/ff0cP1Bx6tD1+T7SAPiDXM/Bqr6oTAbQ=
X-Received: by 2002:a25:6902:: with SMTP id e2mr54067839ybc.97.1608167112302; 
 Wed, 16 Dec 2020 17:05:12 -0800 (PST)
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
 <CAKywueTuGuqT8QN-8Jn1QNHT+HPKysLDhdp1gPsm6+Q0tQnbGA@mail.gmail.com>
 <CANT5p=pUVucG6NhzfziAjsjDnimHCWDUiJP46DYoRqjpXHegsA@mail.gmail.com>
 <0b80c61e-3953-e627-9818-8a8c6c50499e@samba.org>
In-Reply-To: <0b80c61e-3953-e627-9818-8a8c6c50499e@samba.org>
Date: Thu, 17 Dec 2020 06:35:00 +0530
Message-ID: <CANT5p=rYiY0xE-35swsFKVitZD2yTchRiReyA0wVvY+mU_qKEw@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>, sribhat.msa@outlook.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Stefan,

Thanks for the review. My replies inline...

On Mon, 14 Dec, 2020, 23:33 Stefan Metzmacher, <metze@samba.org> wrote:

> Hi Shyam,
>
> in what way is this specific to kerberos?
>
Cifs.ko expects Kerberos TGT to be present in cred cache before the user
mounts the share. If winbind or sssd is configured, this would happen on
most types of user login, by authentication against PAM, except for ssh
private key auth (which is quite common). Hence trying to provide the user
an option to authenticate during the mount.

Do you see use cases outside of krb5, which can make use of this?

Would it make sense to call the configure option just --enable-pam?
> And also remove the 'krb5' from other variables?
>
There's already enable-pam which applies to ntlm multiuser scenario. Let me
recheck if I can integrate with it somehow.

>
> PAM_CIFS_SERVICE "cifs" seems to be unspecific,
> "mount.cifs" or "cifs.mount". Maybe even "mount.smb3"?
>
There could be cases where we need to do PAM auth even in cifs.upcall. For
example, when another user tries to access a multiuser mount. I haven't
coded it here though. So kept the name generic.

>
> Can you fix the indentation of the patch? There seems to be
> a strange mix of leading tabs and whitespaces, which make it hard to
> read the patch.
>
Will fix this in my follow up patch.

>
> With force_pam I would not expect a failure to be ignored.
>
Initially, I was thinking this could be a fallback option, in case mount
fails with ENOKEY. But later changed it to a seperate option. Will fix this
in my next patch.

>
> Why can this only be used with sec=3Dkrb5? Wouldn't it be possible
> to fetch the password from the pam stack in order to pass it to
> the kernel?
>
I don't know of any PAM API to do that. You could use a password without
prompting the user, which I'm doing for cases where password has been
passed as a mount option.

>
> metze
>
> Am 27.11.20 um 11:43 schrieb Shyam Prasad N via samba-technical:
> > Discussed this with Aurelien today.
> >
> > With the patch last sent, users are authenticated using the PAM stack.
> > However, there's no call to cleanup the PAM credentials. Which could
> > leave the kerberos tickets around, even after the umount.
> >
> > To complete this fix, we need a mechanism to tell the umount helper
> > umount.cifs (a new executable to be created) that PAM authentication
> > was used for the mount.
> >
> > There are two possible approaches which I could think of:
> > 1. Add a new mount option in cifs.ko. Inside cifs.ko, this option
> > would be non-functional. But will be used by umount.cifs to call PAM
> > for cleanup.
> > 2. In mount.cifs, keep this info in a temporary file (maybe
> > /var/run/cifs/). umount.cifs will read this and call PAM for cleanup.
> >
> > I feel approach 1 is a cleaner approach to take. Aurelien seems to
> > favour option 1 as well.
> > Please feel free to comment if you feel otherwise.
> > Once we agree on the right approach, I'll send a patch for the changes.
> >
> > Regards,
> > Shyam
> >
> > On Wed, Nov 11, 2020 at 12:53 AM Pavel Shilovsky <piastryyy@gmail.com>
> wrote:
> >>
> >> Sure. Removed the patch and updated the next branch.
> >> --
> >> Best regards,
> >> Pavel Shilovsky
> >>
> >> =D0=B2=D1=82, 10 =D0=BD=D0=BE=D1=8F=D0=B1. 2020 =D0=B3. =D0=B2 05:20, =
Shyam Prasad N <nspmangalore@gmail.com>:
> >>>
> >>> Hi Pavel,
> >>>
> >>> There is more that needs to be done on this item. Otherwise, this wil=
l
> >>> depend on user behaviour to cleanup unused krb5 tickets.
> >>> The pending items on this is to propagate this mount option to cifs.k=
o
> >>> and write an umount.cifs utility to read that mount option to do PAM
> >>> logoff.
> >>> So please rollback this patch for now.
> >>>
> >>> Regards,
> >>> Shyam
> >>>
> >>> On Tue, Nov 10, 2020 at 5:12 AM Pavel Shilovsky <piastryyy@gmail.com>
> wrote:
> >>>>
> >>>> Merged into next. Please let me know if something needs to be fixed.
> Thanks!
> >>>> --
> >>>> Best regards,
> >>>> Pavel Shilovsky
> >>>>
> >>>> =D1=87=D1=82, 24 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 03:39=
, Shyam Prasad N <nspmangalore@gmail.com
> >:
> >>>>>
> >>>>> Hi Aur=C3=A9lien,
> >>>>>
> >>>>> I've implemented most of your review comments. Also fixed the issue=
.
> >>>>>
> >>>>> On Wed, Sep 23, 2020 at 7:26 PM Aur=C3=A9lien Aptel <aaptel@suse.co=
m>
> wrote:
> >>>>>>
> >>>>>> Shyam Prasad N <nspmangalore@gmail.com> writes:
> >>>>>>> Also, I'll test this out with DFS once I figure out how to set it
> up. :)
> >>>>>>> Re-attaching the patch with some minor changes with just the
> >>>>>>> "force_pam" mount option.
> >>>>>>
> >>>>>> You will need 2 Windows VM. DFS is basically symlinks across
> >>>>>> servers. The DFS root VM will host the links (standalone namespace=
)
> and
> >>>>>> you have to make them point to shares on the 2nd VM. You don't nee=
d
> to
> >>>>>> setup replication to test.
> >>>>>>
> >>>>>> When you mount the root in cifs.ko and access a link, the server
> will
> >>>>>> reply that the file is remote. cifs.ko then does an FSCTL on the
> link to
> >>>>>> resolve the target it points to and then connects to the target an=
d
> >>>>>> mounts it under the link seemlessly.
> >>>>>>
> >>>>>>
> >>>>>> Regarding the patch:
> >>>>>>
> >>>>>> * need to update the man page with option and explanation
> >>>>>>
> >>>>>> I have some comments with the style, I know it's annoying.. but it
> >>>>>> would be best to keep the same across the code.
> >>>>>>
> >>>>>> * use the existing indent style (tabs) and avoid adding trailing
> whitespaces.
> >>>>>> * no () for return statements
> >>>>>> * no casting for memory allocation
> >>>>>> * if (X) free(X)  =3D> free(X)
> >>>>>>
> >>>>>> Below some comments about pam_auth_krb5_conv():
> >>>>>>
> >>>>>>> @@ -1809,6 +1824,119 @@ get_password(const char *prompt, char
> *input, int capacity)
> >>>>>>>       return input;
> >>>>>>>  }
> >>>>>>>
> >>>>>>> +#ifdef HAVE_KRB5PAM
> >>>>>>> +#define PAM_CIFS_SERVICE "cifs"
> >>>>>>> +
> >>>>>>> +static int
> >>>>>>> +pam_auth_krb5_conv(int n, const struct pam_message **msg,
> >>>>>>> +    struct pam_response **resp, void *data)
> >>>>>>> +{
> >>>>>>> +    struct parsed_mount_info *parsed_info;
> >>>>>>> +     struct pam_response *reply;
> >>>>>>> +     int i;
> >>>>>>> +
> >>>>>>> +     *resp =3D NULL;
> >>>>>>> +
> >>>>>>> +    parsed_info =3D data;
> >>>>>>> +    if (parsed_info =3D=3D NULL)
> >>>>>>> +             return (PAM_CONV_ERR);
> >>>>>>> +     if (n <=3D 0 || n > PAM_MAX_NUM_MSG)
> >>>>>>> +             return (PAM_CONV_ERR);
> >>>>>>> +
> >>>>>>> +     if ((reply =3D calloc(n, sizeof(*reply))) =3D=3D NULL)
> >>>>>>> +             return (PAM_CONV_ERR);
> >>>>>>> +
> >>>>>>> +     for (i =3D 0; i < n; ++i) {
> >>>>>>> +             switch (msg[i]->msg_style) {
> >>>>>>> +             case PAM_PROMPT_ECHO_OFF:
> >>>>>>> +            if ((reply[i].resp =3D (char *)
> malloc(MOUNT_PASSWD_SIZE + 1)) =3D=3D NULL)
> >>>>>>> +                goto fail;
> >>>>>>> +
> >>>>>>> +            if (parsed_info->got_password &&
> parsed_info->password !=3D NULL) {
> >>>>>>> +                strncpy(reply[i].resp, parsed_info->password,
> MOUNT_PASSWD_SIZE + 1);
> >>>>>>> +            } else if (get_password(msg[i]->msg, reply[i].resp,
> MOUNT_PASSWD_SIZE + 1) =3D=3D NULL) {
> >>>>>>> +                goto fail;
> >>>>>>> +            }
> >>>>>>> +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> >>>>>>> +
> >>>>>>> +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> >>>>>>> +                     break;
> >>>>>>> +             case PAM_PROMPT_ECHO_ON:
> >>>>>>> +                     fprintf(stderr, "%s: ", msg[i]->msg);
> >>>>>>> +            if ((reply[i].resp =3D (char *)
> malloc(MOUNT_PASSWD_SIZE + 1)) =3D=3D NULL)
> >>>>>>> +                goto fail;
> >>>>>>> +
> >>>>>>> +                     if (fgets(reply[i].resp, MOUNT_PASSWD_SIZE =
+
> 1, stdin) =3D=3D NULL)
> >>>>>>
> >>>>>> Do we need to remove the trailing \n from the buffer?
> >>>>>>
> >>>>>>> +                goto fail;
> >>>>>>> +
> >>>>>>> +            reply[i].resp[MOUNT_PASSWD_SIZE] =3D '\0';
> >>>>>>> +
> >>>>>>> +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> >>>>>>> +                     break;
> >>>>>>> +             case PAM_ERROR_MSG:
> >>>>>>
> >>>>>> Shouldn't this PAM_ERROR_MSG case goto fail?
> >>>>>>
> >>>>>>> +             case PAM_TEXT_INFO:
> >>>>>>> +                     fprintf(stderr, "%s: ", msg[i]->msg);
> >>>>>>> +
> >>>>>>> +                     reply[i].resp_retcode =3D PAM_SUCCESS;
> >>>>>>> +                     break;
> >>>>>>> +             default:
> >>>>>>> +                     goto fail;
> >>>>>>> +             }
> >>>>>>> +     }
> >>>>>>> +     *resp =3D reply;
> >>>>>>> +     return (PAM_SUCCESS);
> >>>>>>> +
> >>>>>>> + fail:
> >>>>>>> +     for(i =3D 0; i < n; i++) {
> >>>>>>> +        if (reply[i].resp)
> >>>>>>> +            free(reply[i].resp);
> >>>>>>
> >>>>>> free(NULL) is a no-op, remove the checks.
> >>>>>>
> >>>>>>> +     }
> >>>>>>> +     free(reply);
> >>>>>>> +     return (PAM_CONV_ERR);
> >>>>>>> +}
> >>>>>>
> >>>>>> I gave this a try with a properly configured system joined to AD
> from
> >>>>>> local root account:
> >>>>>>
> >>>>>> aaptel$ ./configure
> >>>>>> ...
> >>>>>> checking krb5.h usability... yes
> >>>>>> checking krb5.h presence... yes
> >>>>>> checking for krb5.h... yes
> >>>>>> checking krb5/krb5.h usability... yes
> >>>>>> checking krb5/krb5.h presence... yes
> >>>>>> checking for krb5/krb5.h... yes
> >>>>>> checking for keyvalue in krb5_keyblock... no
> >>>>>> ...
> >>>>>> checking keyutils.h usability... yes
> >>>>>> checking keyutils.h presence... yes
> >>>>>> checking for keyutils.h... yes
> >>>>>> checking for krb5_init_context in -lkrb5... yes
> >>>>>> ...
> >>>>>> checking for WBCLIENT... yes
> >>>>>> checking for wbcSidsToUnixIds in -lwbclient... yes
> >>>>>> ...
> >>>>>> checking for keyutils.h... (cached) yes
> >>>>>> checking security/pam_appl.h usability... yes
> >>>>>> checking security/pam_appl.h presence... yes
> >>>>>> checking for security/pam_appl.h... yes
> >>>>>> checking for pam_start in -lpam... yes
> >>>>>> checking for security/pam_appl.h... (cached) yes
> >>>>>> checking for krb5_auth_con_getsendsubkey... yes
> >>>>>> checking for krb5_principal_get_realm... no
> >>>>>> checking for krb5_free_unparsed_name... yes
> >>>>>> checking for krb5_auth_con_setaddrs... yes
> >>>>>> checking for krb5_auth_con_set_req_cksumtype... yes
> >>>>>> ...
> >>>>>> aaptel$ make
> >>>>>> ....(ok)
> >>>>>>
> >>>>>> Without force_pam:
> >>>>>>
> >>>>>> root# ./mount.cifs -v //adnuc.nuc.test/data /x -o
> sec=3Dkrb5,username=3Dadministrator,domain=3DNUC
> >>>>>> mount.cifs kernel mount options:
> ip=3D192.168.2.111,unc=3D\\adnuc.nuc.test\data,sec=3Dkrb5,user=3Dadminist=
rator,domain=3DNUC
> >>>>>> mount error(2): No such file or directory
> >>>>>> Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and
> kernel log messages (dmesg)
> >>>>>>
> >>>>>> With force_pam:
> >>>>>>
> >>>>>> root# ./mount.cifs -v //adnuc.nuc.test/data /x -o
> sec=3Dkrb5,username=3Dadministrator,domain=3DNUC,force_pam
> >>>>>> Authenticating as user: administrator
> >>>>>> Error in authenticating user with PAM: Authentication failure
> >>>>>> Attempt to authenticate user with PAM unsuccessful. Still,
> proceeding with mount.
> >>>>>>
> >>>>>> =3D> no further message but mount failed and no msg in dmesg, it
> didn't
> >>>>>>    reach the mount() call
> >>>>>>
> >>>>>> Not sure what is going on. Does the domain need to be passed to PA=
M?
> >>>>>>
> >>>>>> Cheers,
> >>>>>> --
> >>>>>> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> >>>>>> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> >>>>>> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409
> N=C3=BCrnberg, DE
> >>>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (A=
G
> M=C3=BCnchen)
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> -Shyam
> >>>
> >>>
> >>>
> >>> --
> >>> -Shyam
> >
> >
> >
>
>
>
