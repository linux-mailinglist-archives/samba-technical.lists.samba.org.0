Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA0135DB4
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jan 2020 17:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kXkR02KMQUjoHl2oE7ICna2BidhFbvpA98/jkSfITdY=; b=aX+5maaKVK6vYS0KRdJE+Gk9kd
	AEMueMjFN770L/y3IiMARlz7kU6VuIGXk3a1IXt4tkojvnp1cVsnvKhLORbahSGzkEeSvf75rGJzh
	vagZVeubWK0caL/Mv0AM1DZTr507febcmxLfsl0lh3oAk2n127jYhX1ARjAbsqZcqrmLTGIqaGzRI
	2hmIvtGb1rVBkXbLyFQb30Rj2Jv9DbG2Z//QnFemdC/weiYsvQvBY1FgtRvWi7CqsFzt/nMt9Ktyx
	ASHWMFCPkdpcb+yUs93AqjKwegQfaBcOCi20P6m4/LmfLSwwuPsWubPPCUBa9dmTsD1hjXoAZjxXr
	dLOy/M2w==;
Received: from localhost ([::1]:46834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipaLJ-002qxo-4N; Thu, 09 Jan 2020 16:07:29 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43086) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipaLD-002qxh-Mf
 for samba-technical@lists.samba.org; Thu, 09 Jan 2020 16:07:26 +0000
Received: by mail-oi1-x244.google.com with SMTP id p125so6260871oif.10
 for <samba-technical@lists.samba.org>; Thu, 09 Jan 2020 08:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kXkR02KMQUjoHl2oE7ICna2BidhFbvpA98/jkSfITdY=;
 b=XkU5PlARahDIY11MloeM3R2IhsN8l+yfBApdwGfx/QAVjwPWEayaDjy3C7i7wrdHZR
 K7/eIaQudv2Z1MgpYqp5tjYLGG3QAVRR5lQX3+o9zetaSw+ScMQgvLi+a9l6HLQOaV40
 5gF4/5m/3KdkWS9Iy6tL1TKvckn72Vj/mA8qkF7hk8LF/ivPFvSC/qIPKXkT4W05LJb7
 0LyImfMrTRlZ37iHuS36opxpgsWU0X/Ut/JfpJQmahuN3/+fu0GMysfh4ExzSkj8UIg2
 jf6HXYwhrWdxT29ihFHVK0FvsmWnNRGkfMwbJcBTSgnaOXMPOoxBdR/TXNqaXeSqH1HW
 O0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kXkR02KMQUjoHl2oE7ICna2BidhFbvpA98/jkSfITdY=;
 b=YICjdnAN+FSIaPxGTbNWzeu9BkQ+1E/AgmaOV3DgxvGLwisnWRq0B2+fxhp82mbQ+q
 7AORJFhE6srRTqRS/iQqitiLTblcLI3vRvu8tFQ8eYpTO6nVc9ZDWH9wz87Vnz0K+W5W
 80DeKY7HMzU7fnqekg2+5qftv2zb9r5psK25Qz0YRSSdPqz6uQplRa5S3uMzg2nt3zbJ
 bbSAae1fRSwTi4BMM0h9AI2IwYH5EivjjQQtoWX2qfm1iQiFSbqIUMpTE7qpL6Xsf8x0
 wleVhRTk1ds8+UQhQtDDHEbwQtNjN8n0Ud8YgT5FRYy5PQlcfBr2Kk2JDGa56TIGnuOJ
 +D+g==
X-Gm-Message-State: APjAAAWRcO98eJBN+yBV/rkJ/gEcgfaunnQ2CTBjDpxxllBq+X05iw2I
 +aFRnlS/9zLhj7C51dkQ0LLCDR0a83gEZUI1siE=
X-Google-Smtp-Source: APXvYqxr2JDVb3c4RpOL6xNYp1tgtK9hVtUdxcwgl8wiklax8WG19dxceQjBhZ+A4d7lGjQwh/eAC0sN6Z0e6M/jE5k=
X-Received: by 2002:aca:f1c2:: with SMTP id p185mr3773519oih.87.1578586041460; 
 Thu, 09 Jan 2020 08:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
 <20200106163119.9083-2-boris.v.protopopov@gmail.com>
 <CAKywueSK-_zzF-K3_ehmLT3yje_hGaQU-1z-G3hYugMv3ZV-eA@mail.gmail.com>
In-Reply-To: <CAKywueSK-_zzF-K3_ehmLT3yje_hGaQU-1z-G3hYugMv3ZV-eA@mail.gmail.com>
Date: Thu, 9 Jan 2020 11:07:10 -0500
Message-ID: <CAHhKpQ7PCQXgvXkjTUuPtX2OHVxee9seGyRT=omJXvZLt3=ygg@mail.gmail.com>
Subject: Re: [PATCH] Add support for setting owner and group in ntsd
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 sblbir@amazon.com, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes, there is a patch that I have recently posted to linux-cifs and
linux-kernel list (subject line "Add support for setting owner info,
dos attributes, and create time") that enable setting owner/group in
ntsd, file native attributes, and file create time.

Best regards, Boris Protopopov.


On Wed, Jan 8, 2020 at 3:42 PM Pavel Shilovsky <piastryyy@gmail.com> wrote:
>
> =D0=BF=D0=BD, 6 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 08:31, Boris Prot=
opopov <boris.v.protopopov@gmail.com>:
> >
> > Extend setcifsacl utility to allow setting owner and group SIDs
> > in the security descriptor in addition to setting ACLs. This is
> > a user-friendly intefrace for setting owner and group SIDs that
> > takes advantage of the recent extensions in the CIFS kernel
> > client, and it complements setting raw values via setfattr.
> >
> > Signed-off-by: Boris Protopopov <boris.v.protopopov@gmail.com>
>
> Thanks for the patch. Could you clarify which recent changes in the
> CIFS kernel client are referenced in the patch description?
>
> > ---
> >  cifsacl.h         |   4 +-
> >  setcifsacl.c      | 253 ++++++++++++++++++++++++++++++++++++++++++++--=
--------
> >  setcifsacl.rst.in |  27 ++++--
> >  3 files changed, 235 insertions(+), 49 deletions(-)
> >
> > diff --git a/cifsacl.h b/cifsacl.h
> > index ca72dd4..bd0c695 100644
> > --- a/cifsacl.h
> > +++ b/cifsacl.h
> > @@ -26,7 +26,9 @@
> >  #define _CIFSACL_H
> >
> >  #define BUFSIZE 1024
> > -#define ATTRNAME "system.cifs_acl"
> > +#define ATTRNAME       "system.cifs_acl"
> > +#define ATTRNAME_ACL   ATTRNAME
> > +#define ATTRNAME_NTSD  "system.cifs_ntsd"
> >
> >  #define MAX_NUM_AUTHS 6
> >
> > diff --git a/setcifsacl.c b/setcifsacl.c
> > index 9a301e2..6e5a633 100644
> > --- a/setcifsacl.c
> > +++ b/setcifsacl.c
> > @@ -44,7 +44,9 @@ enum setcifsacl_actions {
> >         ActDelete,
> >         ActModify,
> >         ActAdd,
> > -       ActSet
> > +       ActSetAcl,
> > +       ActSetOwner,
> > +       ActSetGroup
> >  };
> >
> >  static void *plugin_handle;
> > @@ -140,6 +142,90 @@ copy_sec_desc(const struct cifs_ntsd *pntsd, struc=
t cifs_ntsd *pnntsd,
> >         return bufsize;
> >  }
> >
> > +/*
> > + * This function (and the one above) does not need to set the SACL-rel=
ated
> > + * fields, and this works fine because on the SMB protocol level, sett=
ing owner
> > + * info, DACL, and SACL requires one to use separate flags that contro=
l which
> > + * part of the descriptor is begin looked at on the server side
> > + */
> > +static ssize_t
> > +copy_sec_desc_with_sid(const struct cifs_ntsd *pntsd, struct cifs_ntsd=
 *pnntsd,
> > +               struct cifs_sid *sid, int maction)
> > +{
> > +       int size, daclsize;
> > +       int osidoffset, gsidoffset, dacloffset;
> > +       int nosidoffset, ngsidoffset, ndacloffset, nsidssize;
> > +       ssize_t bufsize;
> > +       struct cifs_sid *owner_sid_ptr, *group_sid_ptr;
> > +       struct cifs_sid *nowner_sid_ptr, *ngroup_sid_ptr;
> > +       struct cifs_ctrl_acl *dacl_ptr, *ndacl_ptr;
> > +
> > +       /* copy security descriptor control portion */
> > +       osidoffset =3D le32toh(pntsd->osidoffset);
> > +       gsidoffset =3D le32toh(pntsd->gsidoffset);
> > +       dacloffset =3D le32toh(pntsd->dacloffset);
> > +       /*
> > +        * the size of the owner or group sid might be different from t=
he old
> > +        * one, so the group sid offest might change, and if the owner =
is
> > +        * positioned before the DACL, the dacl offset might change as =
well;
> > +        * note however, that the owner sid offset does not change
> > +        */
> > +       nosidoffset =3D osidoffset;
> > +       size =3D sizeof(struct cifs_ntsd);
> > +       pnntsd->revision =3D pntsd->revision;
> > +       pnntsd->type =3D pntsd->type;
> > +       pnntsd->osidoffset =3D pntsd->osidoffset;
> > +       bufsize =3D size;
> > +
> > +       /* set the pointers for source sids */
> > +       if (maction =3D=3D ActSetOwner) {
> > +               owner_sid_ptr =3D sid;
> > +               group_sid_ptr =3D (struct cifs_sid *)((char *)pntsd + g=
sidoffset);
> > +       }
> > +       if (maction =3D=3D ActSetGroup) {
> > +               owner_sid_ptr =3D (struct cifs_sid *)((char *)pntsd + o=
sidoffset);
> > +               group_sid_ptr =3D sid;
> > +       }
> > +
> > +       dacl_ptr =3D (struct cifs_ctrl_acl *)((char *)pntsd + dacloffse=
t);
> > +       daclsize =3D le16toh(dacl_ptr->size) + sizeof(struct cifs_ctrl_=
acl);
> > +
> > +       /* copy owner sid */
> > +       nowner_sid_ptr =3D (struct cifs_sid *)((char *)pnntsd + nosidof=
fset);
> > +       size =3D copy_cifs_sid(nowner_sid_ptr, owner_sid_ptr);
> > +       bufsize +=3D size;
> > +       nsidssize =3D size;
> > +
> > +       /* copy group sid */
> > +       ngsidoffset =3D nosidoffset + size;
> > +       ngroup_sid_ptr =3D (struct cifs_sid *)((char *)pnntsd + ngsidof=
fset);
> > +       pnntsd->gsidoffset =3D htole32(ngsidoffset);
> > +       size =3D copy_cifs_sid(ngroup_sid_ptr, group_sid_ptr);
> > +       bufsize +=3D size;
> > +       nsidssize +=3D size;
> > +
> > +       /* position the dacl control info as in the fetched descriptor =
*/
> > +       if (dacloffset <=3D osidoffset)
> > +               ndacloffset =3D dacloffset;
> > +       else
> > +               ndacloffset =3D nosidoffset + nsidssize;
> > +       ndacl_ptr =3D (struct cifs_ctrl_acl *)((char *)pnntsd + ndaclof=
fset);
> > +       pnntsd->dacloffset =3D htole32(ndacloffset);
> > +
> > +       /* the DACL control fields do not change */
> > +       ndacl_ptr->revision =3D dacl_ptr->revision;
> > +       ndacl_ptr->size =3D dacl_ptr->size;
> > +       ndacl_ptr->num_aces =3D dacl_ptr->num_aces;
> > +
> > +       /*
> > +        * add DACL size (control portion and the array of aces) to the
> > +        * buffer size
> > +        */
> > +       bufsize +=3D daclsize;
> > +
> > +       return bufsize;
> > +}
> > +
> >  static int
> >  copy_ace(struct cifs_ace *dace, struct cifs_ace *sace)
> >  {
> > @@ -788,7 +874,7 @@ setacl_action(struct cifs_ntsd *pntsd, struct cifs_=
ntsd **npntsd,
> >                 rc =3D ace_add(pntsd, npntsd, bufsize, facesptr,
> >                                 numfaces, cacesptr, numcaces);
> >                 break;
> > -       case ActSet:
> > +       case ActSetAcl:
> >                 rc =3D ace_set(pntsd, npntsd, bufsize, cacesptr, numcac=
es);
> >                 break;
> >         default:
> > @@ -803,9 +889,10 @@ static void
> >  setcifsacl_usage(const char *prog)
> >  {
> >         fprintf(stderr,
> > -       "%s: Alter CIFS/NTFS ACL in a security descriptor of a file obj=
ect\n",
> > +       "%s: Alter CIFS/NTFS ACL or owner/group in a security descripto=
r of a file object\n",
> > +               prog);
> > +       fprintf(stderr, "Usage: %s option [<list_of_ACEs>|<SID>] <file_=
name>\n",
> >                 prog);
> > -       fprintf(stderr, "Usage: %s option <list_of_ACEs> <file_name>\n"=
, prog);
> >         fprintf(stderr, "Valid options:\n");
> >         fprintf(stderr, "\t-v   Version of the program\n");
> >         fprintf(stderr, "\n\t-a Add ACE(s), separated by a comma, to an=
 ACL\n");
> > @@ -825,21 +912,32 @@ setcifsacl_usage(const char *prog)
> >         "\n\t-S Replace existing ACL with ACE(s), separated by a comma\=
n");
> >         fprintf(stderr,
> >         "\tsetcifsacl -S \"ACL:Administrator:ALLOWED/0x0/D\" <file_name=
>\n");
> > +       fprintf(stderr,
> > +       "\n\t-o Set owner using specified SID (name or raw format)\n");
> > +       fprintf(stderr,
> > +       "\tsetcifsacl -o \"Administrator\" <file_name>\n");
> > +       fprintf(stderr,
> > +       "\n\t-g Set group using specified SID (name or raw format)\n");
> > +       fprintf(stderr,
> > +       "\tsetcifsacl -g \"Administrators\" <file_name>\n");
> >         fprintf(stderr, "\nRefer to setcifsacl(1) manpage for details\n=
");
> >  }
> >
> >  int
> >  main(const int argc, char *const argv[])
> >  {
> > -       int i, rc, c, numcaces, numfaces;
> > +       int i, rc, c, numcaces =3D 0, numfaces =3D 0;
> >         enum setcifsacl_actions maction =3D ActUnknown;
> >         ssize_t attrlen, bufsize =3D BUFSIZE;
> > -       char *ace_list, *filename, *attrval, **arrptr =3D NULL;
> > +       char *ace_list =3D NULL, *filename =3D NULL, *attrval =3D NULL,
> > +               **arrptr =3D NULL, *sid_str =3D NULL;
> >         struct cifs_ctrl_acl *daclptr =3D NULL;
> >         struct cifs_ace **cacesptr =3D NULL, **facesptr =3D NULL;
> >         struct cifs_ntsd *ntsdptr =3D NULL;
> > +       struct cifs_sid sid;
> > +       char *attrname =3D ATTRNAME_ACL;
> >
> > -       c =3D getopt(argc, argv, "hvD:M:a:S:");
> > +       c =3D getopt(argc, argv, "hvD:M:a:S:o:g:");
> >         switch (c) {
> >         case 'D':
> >                 maction =3D ActDelete;
> > @@ -854,9 +952,19 @@ main(const int argc, char *const argv[])
> >                 ace_list =3D optarg;
> >                 break;
> >         case 'S':
> > -               maction =3D ActSet;
> > +               maction =3D ActSetAcl;
> >                 ace_list =3D optarg;
> >                 break;
> > +       case 'o':
> > +               maction =3D ActSetOwner;
> > +               sid_str =3D optarg;
> > +               attrname =3D ATTRNAME_NTSD;
> > +               break;
> > +       case 'g':
> > +               maction =3D ActSetGroup;
> > +               sid_str =3D optarg;
> > +               attrname =3D ATTRNAME_NTSD;
> > +               break;
> >         case 'h':
> >                 setcifsacl_usage(basename(argv[0]));
> >                 return 0;
> > @@ -875,11 +983,16 @@ main(const int argc, char *const argv[])
> >         }
> >         filename =3D argv[3];
> >
> > -       if (!ace_list) {
> > +       if (!ace_list && maction !=3D ActSetOwner && maction !=3D ActSe=
tGroup) {
> >                 printf("%s: No valid ACEs specified\n", __func__);
> >                 return -1;
> >         }
> >
> > +       if (!sid_str && (maction =3D=3D ActSetOwner || maction =3D=3D A=
ctSetGroup)) {
> > +               printf("%s: No valid SIDs specified\n", __func__);
> > +               return -1;
> > +       }
> > +
> >         if (init_plugin(&plugin_handle)) {
> >                 fprintf(stderr, "WARNING: unable to initialize idmappin=
g "
> >                                 "plugin. Only \"raw\" SID strings will =
be "
> > @@ -889,16 +1002,24 @@ main(const int argc, char *const argv[])
> >                 plugin_loaded =3D true;
> >         }
> >
> > -       numcaces =3D get_numcaces(ace_list);
> > -
> > -       arrptr =3D parse_cmdline_aces(ace_list, numcaces);
> > -       if (!arrptr)
> > -               goto setcifsacl_numcaces_ret;
> > +       if (maction =3D=3D ActSetOwner || maction =3D=3D ActSetGroup) {
> > +               /* parse the sid */
> > +               if (setcifsacl_str_to_sid(sid_str, &sid)) {
> > +                       printf("%s: failed to parce \'%s\' as SID\n", _=
_func__,
> > +                               sid_str);
> > +                       goto setcifsacl_numcaces_ret;
> > +               }
> > +       } else {
> > +               numcaces =3D get_numcaces(ace_list);
> >
> > -       cacesptr =3D build_cmdline_aces(arrptr, numcaces);
> > -       if (!cacesptr)
> > -               goto setcifsacl_cmdlineparse_ret;
> > +               arrptr =3D parse_cmdline_aces(ace_list, numcaces);
> > +               if (!arrptr)
> > +                       goto setcifsacl_numcaces_ret;
> >
> > +               cacesptr =3D build_cmdline_aces(arrptr, numcaces);
> > +               if (!cacesptr)
> > +                       goto setcifsacl_cmdlineparse_ret;
> > +       }
> >  cifsacl:
> >         if (bufsize >=3D XATTR_SIZE_MAX) {
> >                 printf("%s: Buffer size %zd exceeds max size of %d\n",
> > @@ -912,7 +1033,7 @@ cifsacl:
> >                 goto setcifsacl_cmdlineverify_ret;
> >         }
> >
> > -       attrlen =3D getxattr(filename, ATTRNAME, attrval, bufsize);
> > +       attrlen =3D getxattr(filename, attrname, attrval, bufsize);
> >         if (attrlen =3D=3D -1) {
> >                 if (errno =3D=3D ERANGE) {
> >                         free(attrval);
> > @@ -924,26 +1045,64 @@ cifsacl:
> >                 }
> >         }
> >
> > -       numfaces =3D get_numfaces((struct cifs_ntsd *)attrval, attrlen,=
 &daclptr);
> > -       if (!numfaces && maction !=3D ActAdd) { /* if we are not adding=
 aces */
> > -               printf("%s: Empty DACL\n", __func__);
> > -               goto setcifsacl_facenum_ret;
> > -       }
> > +       if (maction =3D=3D ActSetOwner || maction =3D=3D ActSetGroup) {
> > +               struct cifs_ntsd *pfntsd =3D (struct cifs_ntsd *)attrva=
l;
> > +               int dacloffset =3D le32toh(pfntsd->dacloffset);
> > +               struct cifs_ctrl_acl *daclinfo =3D
> > +                               (struct cifs_ctrl_acl *)(attrval + dacl=
offset);
> > +               int numaces =3D le16toh(daclinfo->num_aces);
> > +               int acessize =3D le32toh(daclinfo->size);
> > +               size_t faceoffset, naceoffset;
> > +               char *faceptr, *naceptr;
> >
> > -       facesptr =3D build_fetched_aces((char *)daclptr, numfaces);
> > -       if (!facesptr)
> > -               goto setcifsacl_facenum_ret;
> > +               /*
> > +                * this allocates large enough buffer for max sid size =
and the
> > +                * dacl info from the fetched security descriptor
> > +                */
> > +               rc =3D alloc_sec_desc(pfntsd, &ntsdptr, numaces, &faceo=
ffset);
> > +               if (rc)
> > +                       goto setcifsacl_numcaces_ret;
> >
> > -       bufsize =3D 0;
> > -       rc =3D setacl_action((struct cifs_ntsd *)attrval, &ntsdptr, &bu=
fsize,
> > -               facesptr, numfaces, cacesptr, numcaces, maction);
> > -       if (rc)
> > -               goto setcifsacl_action_ret;
> > +               /*
> > +                * copy the control structures from the fetched descrip=
tor, the
> > +                * sid specified by the user, and adjust the offsets/mo=
ve dacl
> > +                * control structure if needed
> > +                */
> > +               bufsize =3D copy_sec_desc_with_sid(pfntsd, ntsdptr, &si=
d,
> > +                               maction);
> > +
> > +               /* copy aces verbatim as they have not changed */
> > +               faceptr =3D attrval + faceoffset;
> > +               naceoffset =3D le32toh(ntsdptr->dacloffset) +
> > +                               sizeof(struct cifs_ctrl_acl);
> > +               naceptr =3D (char *)ntsdptr + naceoffset;
> > +               memcpy(naceptr, faceptr, acessize);
> > +       } else {
> > +               bufsize =3D 0;
> > +
> > +               numfaces =3D get_numfaces((struct cifs_ntsd *)attrval, =
attrlen,
> > +                               &daclptr);
> > +               if (!numfaces && maction !=3D ActAdd) {
> > +                       /* if we are not adding aces */
> > +                       printf("%s: Empty DACL\n", __func__);
> > +                       goto setcifsacl_facenum_ret;
> > +               }
> > +
> > +               facesptr =3D build_fetched_aces((char *)daclptr, numfac=
es);
> > +               if (!facesptr)
> > +                       goto setcifsacl_facenum_ret;
> >
> > -       attrlen =3D setxattr(filename, ATTRNAME, ntsdptr, bufsize, 0);
> > +               rc =3D setacl_action((struct cifs_ntsd *)attrval, &ntsd=
ptr,
> > +                               &bufsize, facesptr, numfaces, cacesptr,
> > +                               numcaces, maction);
> > +               if (rc)
> > +                       goto setcifsacl_action_ret;
> > +       }
> > +
> > +       attrlen =3D setxattr(filename, attrname, ntsdptr, bufsize, 0);
> >         if (attrlen =3D=3D -1) {
> >                 printf("%s: setxattr error: %s\n", __func__, strerror(e=
rrno));
> > -               goto setcifsacl_facenum_ret;
> > +               goto setcifsacl_action_ret;
> >         }
> >
> >         if (plugin_loaded)
> > @@ -951,25 +1110,33 @@ cifsacl:
> >         return 0;
> >
> >  setcifsacl_action_ret:
> > -       free(ntsdptr);
> > +       if (ntsdptr)
> > +               free(ntsdptr);
> >
> >  setcifsacl_facenum_ret:
> > -       for (i =3D 0; i < numfaces; ++i)
> > -               free(facesptr[i]);
> > -       free(facesptr);
> > +       if (facesptr) {
> > +               for (i =3D 0; i < numfaces; ++i)
> > +                       free(facesptr[i]);
> > +               free(facesptr);
> > +       }
> >
> >  setcifsacl_getx_ret:
> > -       free(attrval);
> > +       if (attrval)
> > +               free(attrval);
> >
> >  setcifsacl_cmdlineverify_ret:
> > -       for (i =3D 0; i < numcaces; ++i)
> > -               free(cacesptr[i]);
> > -       free(cacesptr);
> > +       if (cacesptr) {
> > +               for (i =3D 0; i < numcaces; ++i)
> > +                       free(cacesptr[i]);
> > +               free(cacesptr);
> > +       }
> >
> >  setcifsacl_cmdlineparse_ret:
> > -       free(arrptr);
> > +       if (arrptr)
> > +               free(arrptr);
> >
> >  setcifsacl_numcaces_ret:
> > -       exit_plugin(plugin_handle);
> > +       if (plugin_loaded)
> > +               exit_plugin(plugin_handle);
> >         return -1;
> >  }
> > diff --git a/setcifsacl.rst.in b/setcifsacl.rst.in
> > index de9c758..985af7c 100644
> > --- a/setcifsacl.rst.in
> > +++ b/setcifsacl.rst.in
> > @@ -2,16 +2,16 @@
> >  setcifsacl
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > -----------------------------------------------------------------------=
--------------------------
> > -Userspace helper to alter an ACL in a security descriptor for Common I=
nternet File System (CIFS)
> > -----------------------------------------------------------------------=
--------------------------
> > +----------------------------------------------------------------------=
---------------------------------------------
> > +Userspace helper to alter an ACL or owner/group SID in a security desc=
riptor for Common Internet File System (CIFS)
> > +----------------------------------------------------------------------=
---------------------------------------------
> >  :Manual section: 1
> >
> >  ********
> >  SYNOPSIS
> >  ********
> >
> > -  setcifsacl [-v|-a|-D|-M|-S] "{one or more ACEs}" {file system object=
}
> > +  setcifsacl [-v|-a|-D|-M|-S|-o|-g] "{one or more ACEs or a SID}" {fil=
e system object}
> >
> >  ***********
> >  DESCRIPTION
> > @@ -20,7 +20,7 @@ DESCRIPTION
> >  This tool is part of the cifs-utils suite.
> >
> >  ``setcifsacl`` is a userspace helper program for the Linux CIFS client
> > -file system. It is intended to alter an ACL of a security descriptor
> > +file system. It is intended to alter an ACL or set owner/group SID of =
a security descriptor
> >  for a file system object. Whether a security descriptor to be set is
> >  applied or not is determined by the CIFS/SMB server.
> >
> > @@ -55,6 +55,13 @@ OPTIONS
> >    Set an ACL of security descriptor with the list of ACEs Existing ACL
> >    is replaced entirely with the specified ACEs.
> >
> > +-o
> > +  Set owner SID to one specified as a command line argument.
> > +
> > +-g
> > +  Set group SID to one specified as a command line argument.
> > +
> > +  The owner/group SID can be specified as a name or a raw SID value.
> >    Every ACE entry starts with "ACL:" One or more ACEs are specified
> >    within double quotes.  Multiple ACEs are separated by a comma.
> >
> > @@ -93,6 +100,16 @@ Set an ACL
> >
> >    setcifsacl -S "ACL:CIFSTESTDOM\Administrator:0x0/0x0/FULL,ACL:CIFSTE=
STDOM\user2:0x0/0x0/FULL" <file_name>
> >
> > +Set owner SID
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  setcifsacl -o "S-1-5-21-3338130290-3403600371-1423429424-2102" <file=
_name>
> > +
> > +Set group SID
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  setcifsacl -g "Administrators@BUILTIN" <file_name>
> > +
> >  *****
> >  NOTES
> >  *****
> > --
> > 2.14.5
> >
>
>
> --
> Best regards,
> Pavel Shilovsky

