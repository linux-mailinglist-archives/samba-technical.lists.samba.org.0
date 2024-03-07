Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 266578757E1
	for <lists+samba-technical@lfdr.de>; Thu,  7 Mar 2024 21:04:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=y3AdFgaBRFiwWtav38oyxf2w+fmQE2Ye/PD5BoJP0Q0=; b=tHlUQHLVNDNgIkomUj7+6/AWEe
	4xzIwKp4CRlFLvE8iCuKmt+VazdiHzryaw1fkMcIHmgZarTZqqRGTCo1ofuM+47t3YM1ywU6OCiv1
	11UlYv3B+fGQz/H1RT3ftLfcq6WkOxvWSgfBAfuR/vTAOAhupPtX9FfGSRx2mVE2enD4M9ebP3E5G
	fk41YKCvZ2cWmJdnLY9iZpzwpbgfLvI1VqziWX3wfbPm/4KuaABoqXaITxihzBPu3lCnH5Bzx7LxF
	Qp8+PYv/q2VSHXMaCWq4CCuEzD8CbisFQcP3YU+7Kxtfqj/cb8KLqeW7FmeT4M76In0nwnQadAO1j
	LyPV8S6w==;
Received: from ip6-localhost ([::1]:20476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1riJyF-00C0Y8-QG; Thu, 07 Mar 2024 20:04:03 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:51303) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1riJyB-00C0Y1-V4
 for samba-technical@lists.samba.org; Thu, 07 Mar 2024 20:04:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d208be133bso705861fa.2
 for <samba-technical@lists.samba.org>; Thu, 07 Mar 2024 12:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709841839; x=1710446639; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3AdFgaBRFiwWtav38oyxf2w+fmQE2Ye/PD5BoJP0Q0=;
 b=V797ZtGoOdlooJCdmFLNv/4dVIropK1ee/Kp7QfXhGUJTpuwjic9dGrMjU+YT27Okw
 ysFBsE4POpJcmAEiFZT9qOrlbhfcXXGU3F+ikyYcGuuWiGtfeTyoy1DszLfMaon+dS/E
 cSXZ4w0tHqMkri1Ii9yaYZK+NC+Ps+1HwnmjUf8pwgFvJnzhDFv8P1i5wqBdvTaUMWGS
 OluAJHY+gP1mahT6dBhkt2PDX4ZimdMH4XPRiBSrWPApo74QzK/PYRNwcLkw3IIDzNIZ
 WLI82f/gAnoigBDai88Xj1kNoQ8eHuQjVtwh6xegaxx2g6Vk5xFPOJG888Id1xS3kGeH
 U+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709841839; x=1710446639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3AdFgaBRFiwWtav38oyxf2w+fmQE2Ye/PD5BoJP0Q0=;
 b=HvOyHW+vYVYDLjcKD4u5i/+OIhpJ4uHrpxNAVil+0s9jn9R/7JguE0TerCFStC6jHp
 XG2yfLaWdm8zUO23rwiLjZy/T57WK0DdwfZVS84qzGXwm6JKNRv+hNJhtuUUbN/wAw+c
 8zqRXTUxnlIczHBl0aHDe5LQbYDUkf1epKX6tnT7I+5cWEiWJi1PBUt4MELGkd7ptFdz
 977AnQTxSSD3fJVF9E2zsiOdVVqiqX5nKdu7tzMHlBfHLHdU/IKENkBkzGQSGY8DiHyD
 eNzZebiFXKe8aa+/TMlqqMWt9qL8RWZE7IZMIkBiE7lIkrazdPxxZNHzXtFRtgfr9sc5
 F5hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw7nR4GqPN9bARmkBSA5752XsJNaTTfZGwHp3qkPU2xlli8Ml7JdRDsMvFBdMq1Lmkojnun3qta4clbVEtgcclEwmkIgu/19tKtBs6U20W
X-Gm-Message-State: AOJu0YxhPCqrHSjzXNg+OU/YLzV9ePziLbLrx1hxv1fb+1pMBp4b5CL9
 +u2cvIV3WB69QZH4wna9UhVos0u4Z5L8KvHo6h+sw65uQt4KwaDGciI1nSbk3ee6OfQpGp2nPLD
 BW70OX6qj2U2h5EtUVmEwlFxjI8Y=
X-Google-Smtp-Source: AGHT+IGfavhueNtP7xow4zNB7u0dZSEHD2R1a0/Gm2T/Fnh7eQfE1Bl5R+agVylZLwcVfqFX/T/DQv5CFvPlI7quFyM=
X-Received: by 2002:a2e:b282:0:b0:2d3:f3fe:48ac with SMTP id
 2-20020a2eb282000000b002d3f3fe48acmr1934371ljx.27.1709841838435; Thu, 07 Mar
 2024 12:03:58 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mutAn2G3eC7yRByF5YeCMokzo=Br0AdVRrre0AqRRmTEQ@mail.gmail.com>
 <CAOQ4uxg8YbaYVU1ns5BMtbW8b0Wd8_k=eFWj7o36SkZ5Lokhpg@mail.gmail.com>
 <CAH2r5msvgB19yQsxJtTCeZN+1np3TGkSPnQvgu_C=VyyhT=_6Q@mail.gmail.com>
 <nbqjigckee7m3b5btquetn3wfj3bzcirm75jwnbmhjyxyqximr@ouyqocmrjmfa>
In-Reply-To: <nbqjigckee7m3b5btquetn3wfj3bzcirm75jwnbmhjyxyqximr@ouyqocmrjmfa>
Date: Thu, 7 Mar 2024 14:03:46 -0600
Message-ID: <CAH2r5mt_FY=9Dg6_K1+gYMAKuyPAPO0yRZ9hKcLkyypmUjxQZA@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] statx attributes
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 7, 2024 at 11:45=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Mar 07, 2024 at 10:37:13AM -0600, Steve French wrote:
> > > Which API is used in other OS to query the offline bit?
> > > Do they use SMB specific API, as Windows does?
> >
> > No it is not smb specific - a local fs can also report this.  It is
> > included in the attribute bits for files and directories, it also
> > includes a few additional bits that are used by HSM software on local
> > drives (e.g. FILE_ATTRIBUTE_PINNED when the file may not be taken
> > offline by HSM software)
> > ATTRIBUTE_HIDDEN
> > ATTRIBUTE_SYSTEM
> > ATTRIBUTE_DIRECTORY
> > ATTRIGBUTE_ARCHIVE
> > ATTRIBUTE_TEMPORARY
> > ATTRIBUTE_SPARSE_FILE
> > ATTRIBUTE_REPARE_POINT
> > ATTRIBUTE_COMPRESSED
> > ATTRIBUTE_NOT_CONTENT_INDEXED
> > ATTRIBUTE_ENCRYPTED
> > ATTRIBUTE_OFFLINE
>
> we've already got some of these as inode flags available with the
> getflags ioctl (compressed, also perhaps encrypted?) - but statx does
> seem a better place for them.
>
> statx can also report when they're supported, which does make sense for
> these.
>
> ATTRIBUTE_DIRECTORY, though?
>
> we also need to try to define the semantics for these and not just dump
> them in as just a bunch of identifiers if we want them to be used by
> other things - and we do.

They are all pretty clearly defined, but many are already in Linux,
and a few are not relevant (e.g. ATTRIBUTE_DIRECTORY is handled in
mode bits).  I suspect that Macs have equivalents of most of these
too.


--=20
Thanks,

Steve

