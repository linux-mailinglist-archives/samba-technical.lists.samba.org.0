Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DCC98FD23
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2024 07:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TeDnKNqdxi7+cKtC8lTerSKgFbqUdcUVW96yUghrkI0=; b=C5Mw8TRVAyM8hau6oplwpWofNk
	qfzeJkJ9i5UwZGCXqHvSAiXXaFAfLHnjysBDfHNK+iYnsd39pY4SZvhfgvWWjNzzlCqD/IF5RWkjn
	RJSY0yPlDlKu5+vP4JTZ0TiocmGE40jhvRZj+LGhUZjoIsKlk2qAG3KGogrjqgP6v3jB8ln/hcJDT
	5102yBIdJkDz3agKNEtnFDfLu8wgzWH5I9rJvDkhJXtl4iMhDf0fipDcZaoVnp6lIE+OoWXitQ+GI
	vPf3oO6UmDaY+Uvk71Fkkf3suhXyCkruP0lLZ4zcTbrRrKJHkz5lv+iCLOb8nrdTuDuktiYlfp9Ym
	aZ7oSShQ==;
Received: from ip6-localhost ([::1]:49680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1swbI1-0030wS-HK; Fri, 04 Oct 2024 05:55:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:52284) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1swbHu-0030wL-Ur
 for samba-technical@lists.samba.org; Fri, 04 Oct 2024 05:55:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37cdac05af9so1664710f8f.0
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2024 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egnyte.com; s=google; t=1728021337; x=1728626137; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XGZv+0tqX/grFJ628hzo/ZdGOJrk8UMvL2H0gOb8d8c=;
 b=Wqlh0HWXXS9QLx3fTj6S9dFcpUz9K4b5VfrJN1CfD7XibG7h3QY32e22mEruvia300
 4WDIqxTtWUaG37j9d+S0mNyZisU+aTtGvnS1QZamF8ccFG/KI4vjXZXNlxGZl9+Ql4gK
 qH1fx1lM5LeXRs2ilvCuJDi6Fnd+IeOT9YpLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728021337; x=1728626137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XGZv+0tqX/grFJ628hzo/ZdGOJrk8UMvL2H0gOb8d8c=;
 b=w18DQpLbjvnOazsgnFZXUe2+tswSzFqGg9Q3NK428l1WftZEAwVstgQgtkYew+adce
 fJ4G1ko6Dg8XZ5z7UeTF+KUqilJemo+GcyeVJ+S9TVcHB1fnF0ttCqxjv/F/gCIwaokw
 FZ/qxAsQzqOApWr8iIehprw/yAIXJ9o3vBFT3Jbo+18e0E5InCyYseH6p+/fUP4sL71L
 fOEb4US35hvljSMq2dTk7lMUVIe6CRtG1VPA6Ng0SrrRAW0STx3y78pzfHQCNC2u4oBT
 dQcm9LVv/amf21nVjRsPmQkOXwVdBVuHA8oG0/rfC7hxeFVLb0AIPVdJ5A1BGGdq5y+S
 7MRg==
X-Gm-Message-State: AOJu0YyOrNWEGW2xVGor4TACJPanYNknn0fS52eVo5RkHYVDI0KPS4xI
 6ILrpc7nFv5CpRqFHj86k9+rZajbkoz1adMcZ577TxAzT7clKjWhjClgoct7FlPe3tsn6mGS2Pk
 mTMxxi1DxHxYcRWfUABI6PVgD0eNaRhYxZwDNMgkHf49llaT9QhpGiw==
X-Google-Smtp-Source: AGHT+IGzAHFuS+i2SSzvG9gY4pB7yhfRALyI/sp8tqMdEFd3KEQHKoNDVHSxnvi0pvw95zv64E1Cdq5nKEqRO7XeDBw=
X-Received: by 2002:a5d:43d1:0:b0:37c:cfbb:d357 with SMTP id
 ffacd0b85a97d-37d0e77743emr1238037f8f.30.1728021336665; Thu, 03 Oct 2024
 22:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAF2c6-EiavvBJmf6gKRp394E1s4AjANH29PqWeJbiNdbCas3YA@mail.gmail.com>
 <faa88fc1-369b-4278-bdf1-28ce69baa41a@samba.org>
In-Reply-To: <faa88fc1-369b-4278-bdf1-28ce69baa41a@samba.org>
Date: Fri, 4 Oct 2024 11:25:25 +0530
Message-ID: <CAF2c6-FqSLG1r0mF09LqfOJqPq8DDz8G8Xbf=eOXJGFKNDOJjw@mail.gmail.com>
Subject: Re: VFS fruit and streams_xattr fake_fd passed on to other modules in
 stack
To: Ralph Boehme <slow@samba.org>
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
From: Varun Mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: Varun Mittal <vmittal@egnyte.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

>  I guess the fix is to implement filesystem_sharemode in fruit as a no-op

Thanks for the reply. I have made this change that I'll validate with my
setup

+static int fruit_filesystem_sharemode(vfs_handle_struct *handle,
+                                     files_struct *fsp,
+                                     uint32_t share_access,
+                                     uint32_t access_mask)
+{
+       struct fio *fio =3D fruit_get_complete_fio(handle, fsp);
+
+       if (fio =3D=3D NULL || !fio->fake_fd) {
+               return SMB_VFS_NEXT_FILESYSTEM_SHAREMODE(handle,
+                                                        fsp,
+                                                        share_access,
+                                                        access_mask);
+       }
+
+       return 0;
+}
+

Is something similar required for streams_xattr_close as well?
As I mentioned the close call is reaching the next module in some cases

+       struct stream_io *sio =3D
+               (struct stream_io *)VFS_FETCH_FSP_EXTENSION(handle, fsp);
+
        fd =3D fsp_get_pathref_fd(fsp);

        DBG_DEBUG("streams_xattr_close called [%s] fd [%d]\n",
                        smb_fname_str_dbg(fsp->fsp_name), fd);

 -       if (!fsp_is_alternate_stream(fsp)) {
+       if (sio =3D=3D NULL) {
                return SMB_VFS_NEXT_CLOSE(handle, fsp);
        }

On Mon, Sep 30, 2024 at 1:47=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:

> Hi Varun,
>
> On 9/26/24 10:41 AM, Varun Mittal via samba-technical wrote:
> > Am I missing some configuration ?
>
> I guess this is currently not supported by fruit and would require some
> development effort to implement this.
>
> Unless using streams_depot, kernel share modes can't work when streams
> are backed by xattrs, so I guess the fix is to implement
> filesystem_sharemode in fruit as a no-op, but I'd have to take a closer
> look.
>
> -slow
>
> --
> SerNet Samba Team Lead https://sernet.de/
> Samba Team Member      https://samba.org/
> SAMBA+ packages       https://samba.plus/
>
