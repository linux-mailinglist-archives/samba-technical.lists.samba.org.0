Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0C370546
	for <lists+samba-technical@lfdr.de>; Sat,  1 May 2021 06:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Om8vcP8JuXsUsSvYa8GpVDxDty8FOuGZEijEAi05J2w=; b=BY7eTRiWghfR5PX5kbEV3Ta1Rh
	C/fdEmbSJKYS8GNLgTxxUUJqGy8lrHok1x1GBAYrWUZhMM0CyHTgggo4ywGOpDCY3IEwPa5tMwPRP
	byT2ZzF8sV91vY7UbtssGa5u5xPteJa7w7X/dEUknvenWUipn4PywZSxlmr6TbBvb0Rfn5oG6oNZK
	Kk9X4cHhgLD7rKbS2X8PPKmLNAyMg7r+fxACRq09G9XAmW/8cOq94LSlQF5LFAT4zybjo/WL7Nr9u
	1Z0fsTVpdJgqjgmxDx4dVxRpAGGORRitBTfPappTH8985z7Uv+JtPwDj7br/RCUzGLvGFrJMnlbAk
	VMRkNtWQ==;
Received: from ip6-localhost ([::1]:51456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lch4M-00F6BS-37; Sat, 01 May 2021 04:17:30 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:42612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lch4F-00F6BL-Nd
 for samba-technical@lists.samba.org; Sat, 01 May 2021 04:17:27 +0000
Received: by mail-lj1-x234.google.com with SMTP id l22so562378ljc.9
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 21:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Om8vcP8JuXsUsSvYa8GpVDxDty8FOuGZEijEAi05J2w=;
 b=NDqaDuLT83rOWzzg8XYyCsO/+bWEjsLixELgX9FOa1qEJGYkrBpmP0zKYaDvcDEvD0
 fbELDWtdgOH7LXBau03TEO5hDjbLygDRVX2n3vrdKvZJJulAKYU8czLkcPOmi3nRWM3F
 zM16pnL0Sa+DPCWXokLu6SJpNOFWzwfolMFARZpH9j4u8jgYEn+Mt53/5RFL6N/Lg8dQ
 WFFw0bsn+uFSuYv04mG91PH4jWS/Bx6SxbW0kLKt9bjeqCujohn5c1y3De/X6egZ5FC+
 fddBpgXov/eidrx3dLovW2yKOnTT+2v6JCmPVuvtzZ9TvrCANYC67dkjsyC58WxU4F7g
 gS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Om8vcP8JuXsUsSvYa8GpVDxDty8FOuGZEijEAi05J2w=;
 b=jZ8WPrPGpZAeM/PLRnXmJEUiElHMXQmsYV9hrdMvDZTaXi3TXJq6oVprqSuZQv9kp+
 vqlsMSNoBi4skDVJHmms84SAfzxOSYxoZWIB8YOSVwBvzNr0hrLXGR9tt9z9CbLXV9Iz
 C8VBTsMFoIPM4v9Z21R4qGFi3KEdO2nf8j2vRe7yD1NM9bqME5L4DvVen4V/paDA4q5F
 qdVidGEZD2HNm6NVwh2Zm02mCWxvEAAtYh8WyVqN+TF4LhVFh0yCnjZo58wy0wHS972m
 wadgOpCmksQ55vLwMXapgJB+NFBlgajNb0c4+NEmYXCe3v8OF3JFWVwJt87bDZjoLGK5
 1Pwg==
X-Gm-Message-State: AOAM531tkxJUorAtoOCBb4WCFDMYtF5HgvxgYW7V+KZp+dmKtQ5qIehV
 Hud0rEL56wkrebuOFvkIUfJ80HNwDYtqIRxeUJo=
X-Google-Smtp-Source: ABdhPJzCebr3y9RO5hr8ujomOqvtkx7W0orRWD1Eg2Jn1N64SwERGs+XKNq2o8/60oXWRJcIJblwnUbd26Kc9zamheo=
X-Received: by 2002:a2e:3208:: with SMTP id y8mr5988117ljy.477.1619842642189; 
 Fri, 30 Apr 2021 21:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <CAN05THQzSCZwypBWg9YZAarjrsQ74qowp4Bneo3crW9FfqVqPA@mail.gmail.com>
In-Reply-To: <CAN05THQzSCZwypBWg9YZAarjrsQ74qowp4Bneo3crW9FfqVqPA@mail.gmail.com>
Date: Fri, 30 Apr 2021 23:17:11 -0500
Message-ID: <CAH2r5muu3YiBAk1Mf_xOFQJih8Ms7sQhNUKwUrFreggK-Mmr-A@mail.gmail.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000047af3105c13d0141"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000047af3105c13d0141
Content-Type: text/plain; charset="UTF-8"

changed as suggested - see attached

On Fri, Apr 30, 2021 at 11:00 PM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> These elements should probably be [32] and not
> + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
>
> Because this is now visible to userspace and we can not allow this to
> ever change.
> Because when GCM512 is eventually released, if we bump
> SMB3_ENC_DEC_KEY_SIZE to a larger value we suddenly break userspace.
>
>
> On Sat, May 1, 2021 at 8:20 AM Steve French <smfrench@gmail.com> wrote:
> >
> > Previously we were only able to dump CCM or GCM-128 keys (see "smbinfo
> > keys" e.g.)
> > to allow network debugging (e.g. wireshark) of mounts to SMB3.1.1 encrypted
> > shares.  But with the addition of GCM-256 support, we have to be able to dump
> > 32 byte instead of 16 byte keys which requires adding an additional ioctl
> > for that.
> >
> > Signed-off-by: Steve French <stfrench@microsoft.com>
> > ---
> >  fs/cifs/cifs_ioctl.h | 19 +++++++++++++++++++
> >  fs/cifs/ioctl.c      | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/fs/cifs/cifs_ioctl.h b/fs/cifs/cifs_ioctl.h
> > index f262c64516bc..9f2ed9cccb08 100644
> > --- a/fs/cifs/cifs_ioctl.h
> > +++ b/fs/cifs/cifs_ioctl.h
> > @@ -57,6 +57,12 @@ struct smb_query_info {
> >   /* char buffer[]; */
> >  } __packed;
> >
> > +/*
> > + * Dumping the commonly used 16 byte (e.g. CCM and GCM128) keys still supported
> > + * for backlevel compatibility, but is not sufficient for dumping the less
> > + * frequently used GCM256 (32 byte) keys (see the newer "CIFS_DUMP_FULL_KEY"
> > + * ioctl for dumping decryption info for GCM256 mounts)
> > + */
> >  struct smb3_key_debug_info {
> >   __u64 Suid;
> >   __u16 cipher_type;
> > @@ -65,6 +71,18 @@ struct smb3_key_debug_info {
> >   __u8 smb3decryptionkey[SMB3_SIGN_KEY_SIZE];
> >  } __packed;
> >
> > +/*
> > + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
> > + * is needed if GCM256 (stronger encryption) negotiated
> > + */
> > +struct smb3_full_key_debug_info {
> > + __u64 Suid;
> > + __u16 cipher_type;
> > + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */
> > + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > + __u8 smb3decryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > +} __packed;
> > +
> >  struct smb3_notify {
> >   __u32 completion_filter;
> >   bool watch_tree;
> > @@ -78,6 +96,7 @@ struct smb3_notify {
> >  #define CIFS_QUERY_INFO _IOWR(CIFS_IOCTL_MAGIC, 7, struct smb_query_info)
> >  #define CIFS_DUMP_KEY _IOWR(CIFS_IOCTL_MAGIC, 8, struct smb3_key_debug_info)
> >  #define CIFS_IOC_NOTIFY _IOW(CIFS_IOCTL_MAGIC, 9, struct smb3_notify)
> > +#define CIFS_DUMP_FULL_KEY _IOWR(CIFS_IOCTL_MAGIC, 10, struct
> > smb3_full_key_debug_info)
> >  #define CIFS_IOC_SHUTDOWN _IOR ('X', 125, __u32)
> >
> >  /*
> > diff --git a/fs/cifs/ioctl.c b/fs/cifs/ioctl.c
> > index ef41fa878793..e4321e2a27d2 100644
> > --- a/fs/cifs/ioctl.c
> > +++ b/fs/cifs/ioctl.c
> > @@ -218,6 +218,7 @@ long cifs_ioctl(struct file *filep, unsigned int
> > command, unsigned long arg)
> >  {
> >   struct inode *inode = file_inode(filep);
> >   struct smb3_key_debug_info pkey_inf;
> > + struct smb3_full_key_debug_info pfull_key_inf;
> >   int rc = -ENOTTY; /* strange error - but the precedent */
> >   unsigned int xid;
> >   struct cifsFileInfo *pSMBFile = filep->private_data;
> > @@ -354,6 +355,38 @@ long cifs_ioctl(struct file *filep, unsigned int
> > command, unsigned long arg)
> >   else
> >   rc = 0;
> >   break;
> > + /*
> > + * Dump full key (32 bytes instead of 16 bytes) is
> > + * needed if GCM256 (stronger encryption) negotiated
> > + */
> > + case CIFS_DUMP_FULL_KEY:
> > + if (pSMBFile == NULL)
> > + break;
> > + if (!capable(CAP_SYS_ADMIN)) {
> > + rc = -EACCES;
> > + break;
> > + }
> > +
> > + tcon = tlink_tcon(pSMBFile->tlink);
> > + if (!smb3_encryption_required(tcon)) {
> > + rc = -EOPNOTSUPP;
> > + break;
> > + }
> > + pfull_key_inf.cipher_type =
> > + le16_to_cpu(tcon->ses->server->cipher_type);
> > + pfull_key_inf.Suid = tcon->ses->Suid;
> > + memcpy(pfull_key_inf.auth_key, tcon->ses->auth_key.response,
> > + 16 /* SMB2_NTLMV2_SESSKEY_SIZE */);
> > + memcpy(pfull_key_inf.smb3decryptionkey,
> > +       tcon->ses->smb3decryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> > + memcpy(pfull_key_inf.smb3encryptionkey,
> > +       tcon->ses->smb3encryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> > + if (copy_to_user((void __user *)arg, &pfull_key_inf,
> > + sizeof(struct smb3_full_key_debug_info)))
> > + rc = -EFAULT;
> > + else
> > + rc = 0;
> > + break;
> >   case CIFS_IOC_NOTIFY:
> >   if (!S_ISDIR(inode->i_mode)) {
> >   /* Notify can only be done on directories */
> >
> > --
> > Thanks,
> >
> > Steve



-- 
Thanks,

Steve

--00000000000047af3105c13d0141
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3.1.1-allow-dumping-GCM256-keys-to-improve-debugg.patch"
Content-Disposition: attachment; 
	filename="0001-smb3.1.1-allow-dumping-GCM256-keys-to-improve-debugg.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ko58h80g0>
X-Attachment-Id: f_ko58h80g0

RnJvbSBhNTFhMmVhMGY4ZDcyZjBjM2U2OTFmMjUzYmIyYjQ4ZGI2OWNiMDM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMzAgQXByIDIwMjEgMTc6MTQ6NDUgLTA1MDAKU3ViamVjdDogW1BBVENIIDEv
Ml0gc21iMy4xLjE6IGFsbG93IGR1bXBpbmcgR0NNMjU2IGtleXMgdG8gaW1wcm92ZSBkZWJ1Z2dp
bmcKIG9mIGVuY3J5cHRlZCBzaGFyZXMKClByZXZpb3VzbHkgd2Ugd2VyZSBvbmx5IGFibGUgdG8g
ZHVtcCBDQ00gb3IgR0NNLTEyOCBrZXlzIChzZWUgInNtYmluZm8ga2V5cyIgZS5nLikKdG8gYWxs
b3cgbmV0d29yayBkZWJ1Z2dpbmcgKGUuZy4gd2lyZXNoYXJrKSBvZiBtb3VudHMgdG8gU01CMy4x
LjEgZW5jcnlwdGVkCnNoYXJlcy4gIEJ1dCB3aXRoIHRoZSBhZGRpdGlvbiBvZiBHQ00tMjU2IHN1
cHBvcnQsIHdlIGhhdmUgdG8gYmUgYWJsZSB0byBkdW1wCjMyIGJ5dGUgaW5zdGVhZCBvZiAxNiBi
eXRlIGtleXMgd2hpY2ggcmVxdWlyZXMgYWRkaW5nIGFuIGFkZGl0aW9uYWwgaW9jdGwKZm9yIHRo
YXQuCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
Ci0tLQogZnMvY2lmcy9jaWZzX2lvY3RsLmggfCAxOSArKysrKysrKysrKysrKysrKysrCiBmcy9j
aWZzL2lvY3RsLmMgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9j
aWZzX2lvY3RsLmggYi9mcy9jaWZzL2NpZnNfaW9jdGwuaAppbmRleCBmMjYyYzY0NTE2YmMuLjlm
MmVkOWNjY2IwOCAxMDA2NDQKLS0tIGEvZnMvY2lmcy9jaWZzX2lvY3RsLmgKKysrIGIvZnMvY2lm
cy9jaWZzX2lvY3RsLmgKQEAgLTU3LDYgKzU3LDEyIEBAIHN0cnVjdCBzbWJfcXVlcnlfaW5mbyB7
CiAJLyogY2hhciBidWZmZXJbXTsgKi8KIH0gX19wYWNrZWQ7CiAKKy8qCisgKiBEdW1waW5nIHRo
ZSBjb21tb25seSB1c2VkIDE2IGJ5dGUgKGUuZy4gQ0NNIGFuZCBHQ00xMjgpIGtleXMgc3RpbGwg
c3VwcG9ydGVkCisgKiBmb3IgYmFja2xldmVsIGNvbXBhdGliaWxpdHksIGJ1dCBpcyBub3Qgc3Vm
ZmljaWVudCBmb3IgZHVtcGluZyB0aGUgbGVzcworICogZnJlcXVlbnRseSB1c2VkIEdDTTI1NiAo
MzIgYnl0ZSkga2V5cyAoc2VlIHRoZSBuZXdlciAiQ0lGU19EVU1QX0ZVTExfS0VZIgorICogaW9j
dGwgZm9yIGR1bXBpbmcgZGVjcnlwdGlvbiBpbmZvIGZvciBHQ00yNTYgbW91bnRzKQorICovCiBz
dHJ1Y3Qgc21iM19rZXlfZGVidWdfaW5mbyB7CiAJX191NjQJU3VpZDsKIAlfX3UxNgljaXBoZXJf
dHlwZTsKQEAgLTY1LDYgKzcxLDE4IEBAIHN0cnVjdCBzbWIzX2tleV9kZWJ1Z19pbmZvIHsKIAlf
X3U4CXNtYjNkZWNyeXB0aW9ua2V5W1NNQjNfU0lHTl9LRVlfU0laRV07CiB9IF9fcGFja2VkOwog
CisvKgorICogRHVtcCBmdWxsIGtleSAoMzIgYnl0ZSBlbmNyeXB0L2RlY3J5cHQga2V5cyBpbnN0
ZWFkIG9mIDE2IGJ5dGVzKQorICogaXMgbmVlZGVkIGlmIEdDTTI1NiAoc3Ryb25nZXIgZW5jcnlw
dGlvbikgbmVnb3RpYXRlZAorICovCitzdHJ1Y3Qgc21iM19mdWxsX2tleV9kZWJ1Z19pbmZvIHsK
KwlfX3U2NAlTdWlkOworCV9fdTE2CWNpcGhlcl90eXBlOworCV9fdTgJYXV0aF9rZXlbMTZdOyAv
KiBTTUIyX05UTE1WMl9TRVNTS0VZX1NJWkUgKi8KKwlfX3U4CXNtYjNlbmNyeXB0aW9ua2V5WzMy
XTsgLyogU01CM19FTkNfREVDX0tFWV9TSVpFICovCisJX191OAlzbWIzZGVjcnlwdGlvbmtleVsz
Ml07IC8qIFNNQjNfRU5DX0RFQ19LRVlfU0laRSAqLworfSBfX3BhY2tlZDsKKwogc3RydWN0IHNt
YjNfbm90aWZ5IHsKIAlfX3UzMgljb21wbGV0aW9uX2ZpbHRlcjsKIAlib29sCXdhdGNoX3RyZWU7
CkBAIC03OCw2ICs5Niw3IEBAIHN0cnVjdCBzbWIzX25vdGlmeSB7CiAjZGVmaW5lIENJRlNfUVVF
UllfSU5GTyBfSU9XUihDSUZTX0lPQ1RMX01BR0lDLCA3LCBzdHJ1Y3Qgc21iX3F1ZXJ5X2luZm8p
CiAjZGVmaW5lIENJRlNfRFVNUF9LRVkgX0lPV1IoQ0lGU19JT0NUTF9NQUdJQywgOCwgc3RydWN0
IHNtYjNfa2V5X2RlYnVnX2luZm8pCiAjZGVmaW5lIENJRlNfSU9DX05PVElGWSBfSU9XKENJRlNf
SU9DVExfTUFHSUMsIDksIHN0cnVjdCBzbWIzX25vdGlmeSkKKyNkZWZpbmUgQ0lGU19EVU1QX0ZV
TExfS0VZIF9JT1dSKENJRlNfSU9DVExfTUFHSUMsIDEwLCBzdHJ1Y3Qgc21iM19mdWxsX2tleV9k
ZWJ1Z19pbmZvKQogI2RlZmluZSBDSUZTX0lPQ19TSFVURE9XTiBfSU9SICgnWCcsIDEyNSwgX191
MzIpCiAKIC8qCmRpZmYgLS1naXQgYS9mcy9jaWZzL2lvY3RsLmMgYi9mcy9jaWZzL2lvY3RsLmMK
aW5kZXggZWY0MWZhODc4NzkzLi5lNDMyMWUyYTI3ZDIgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvaW9j
dGwuYworKysgYi9mcy9jaWZzL2lvY3RsLmMKQEAgLTIxOCw2ICsyMTgsNyBAQCBsb25nIGNpZnNf
aW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQgY29tbWFuZCwgdW5zaWduZWQg
bG9uZyBhcmcpCiB7CiAJc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUoZmlsZXApOwog
CXN0cnVjdCBzbWIzX2tleV9kZWJ1Z19pbmZvIHBrZXlfaW5mOworCXN0cnVjdCBzbWIzX2Z1bGxf
a2V5X2RlYnVnX2luZm8gcGZ1bGxfa2V5X2luZjsKIAlpbnQgcmMgPSAtRU5PVFRZOyAvKiBzdHJh
bmdlIGVycm9yIC0gYnV0IHRoZSBwcmVjZWRlbnQgKi8KIAl1bnNpZ25lZCBpbnQgeGlkOwogCXN0
cnVjdCBjaWZzRmlsZUluZm8gKnBTTUJGaWxlID0gZmlsZXAtPnByaXZhdGVfZGF0YTsKQEAgLTM1
NCw2ICszNTUsMzggQEAgbG9uZyBjaWZzX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlcCwgdW5zaWdu
ZWQgaW50IGNvbW1hbmQsIHVuc2lnbmVkIGxvbmcgYXJnKQogCQkJZWxzZQogCQkJCXJjID0gMDsK
IAkJCWJyZWFrOworCQkvKgorCQkgKiBEdW1wIGZ1bGwga2V5ICgzMiBieXRlcyBpbnN0ZWFkIG9m
IDE2IGJ5dGVzKSBpcworCQkgKiBuZWVkZWQgaWYgR0NNMjU2IChzdHJvbmdlciBlbmNyeXB0aW9u
KSBuZWdvdGlhdGVkCisJCSAqLworCQljYXNlIENJRlNfRFVNUF9GVUxMX0tFWToKKwkJCWlmIChw
U01CRmlsZSA9PSBOVUxMKQorCQkJCWJyZWFrOworCQkJaWYgKCFjYXBhYmxlKENBUF9TWVNfQURN
SU4pKSB7CisJCQkJcmMgPSAtRUFDQ0VTOworCQkJCWJyZWFrOworCQkJfQorCisJCQl0Y29uID0g
dGxpbmtfdGNvbihwU01CRmlsZS0+dGxpbmspOworCQkJaWYgKCFzbWIzX2VuY3J5cHRpb25fcmVx
dWlyZWQodGNvbikpIHsKKwkJCQlyYyA9IC1FT1BOT1RTVVBQOworCQkJCWJyZWFrOworCQkJfQor
CQkJcGZ1bGxfa2V5X2luZi5jaXBoZXJfdHlwZSA9CisJCQkJbGUxNl90b19jcHUodGNvbi0+c2Vz
LT5zZXJ2ZXItPmNpcGhlcl90eXBlKTsKKwkJCXBmdWxsX2tleV9pbmYuU3VpZCA9IHRjb24tPnNl
cy0+U3VpZDsKKwkJCW1lbWNweShwZnVsbF9rZXlfaW5mLmF1dGhfa2V5LCB0Y29uLT5zZXMtPmF1
dGhfa2V5LnJlc3BvbnNlLAorCQkJCQkxNiAvKiBTTUIyX05UTE1WMl9TRVNTS0VZX1NJWkUgKi8p
OworCQkJbWVtY3B5KHBmdWxsX2tleV9pbmYuc21iM2RlY3J5cHRpb25rZXksCisJCQkgICAgICB0
Y29uLT5zZXMtPnNtYjNkZWNyeXB0aW9ua2V5LCAzMiAvKiBTTUIzX0VOQ19ERUNfS0VZX1NJWkUg
Ki8pOworCQkJbWVtY3B5KHBmdWxsX2tleV9pbmYuc21iM2VuY3J5cHRpb25rZXksCisJCQkgICAg
ICB0Y29uLT5zZXMtPnNtYjNlbmNyeXB0aW9ua2V5LCAzMiAvKiBTTUIzX0VOQ19ERUNfS0VZX1NJ
WkUgKi8pOworCQkJaWYgKGNvcHlfdG9fdXNlcigodm9pZCBfX3VzZXIgKilhcmcsICZwZnVsbF9r
ZXlfaW5mLAorCQkJCQlzaXplb2Yoc3RydWN0IHNtYjNfZnVsbF9rZXlfZGVidWdfaW5mbykpKQor
CQkJCXJjID0gLUVGQVVMVDsKKwkJCWVsc2UKKwkJCQlyYyA9IDA7CisJCQlicmVhazsKIAkJY2Fz
ZSBDSUZTX0lPQ19OT1RJRlk6CiAJCQlpZiAoIVNfSVNESVIoaW5vZGUtPmlfbW9kZSkpIHsKIAkJ
CQkvKiBOb3RpZnkgY2FuIG9ubHkgYmUgZG9uZSBvbiBkaXJlY3RvcmllcyAqLwotLSAKMi4yNy4w
Cgo=
--00000000000047af3105c13d0141--

