Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39014912235
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2024 12:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=I5MZnkv/q7nJY4HHzW8meFkkO/c4uNlLeBVqHiXc3xU=; b=qz2NfPIPjfuZHlaEUFJw1q3BMy
	3MmewxaPBS1jHLa3dKW59rkQqqwDu36SrRSLZSt1VwV3drzMDKre4mxX5Kidv62KInmVNdv3Jg5Dv
	aRlLEjTnfi0EC5DWbtgpbqhnG1eyAC2ldPe0T+yziaEBPz1wRTZw5Ek1FbS2Wj1U98l+KBICW/Jk1
	bEdYgctpzgOsRZL6UhxQovf3cU7IKvlT754VSA8qYAXzvBEEYjATb1dYFjPsTab5MT5Y0VwT2zapH
	VjDgShCv6KjYX7Phw4ehfCH7ojH2e3/hsKeCq5DSxy7XLS/eZ41Oq8Bf5DPrU0LHTo/R7WGm/ctsH
	/xOiR0TQ==;
Received: from ip6-localhost ([::1]:39516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKbNm-00EqiE-3C; Fri, 21 Jun 2024 10:20:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30695) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sKbNg-00Eqi4-Gz
 for samba-technical@lists.samba.org; Fri, 21 Jun 2024 10:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718965228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5MZnkv/q7nJY4HHzW8meFkkO/c4uNlLeBVqHiXc3xU=;
 b=ajY87xSMu+MetUrUl2EeOi/eLR2pxkd9sQF+zOpNeFqBldnNQB/ZMNXdHA0FHkEI8I9olD
 FAdvPwLR06Xu1t4FumUHwuJC/1YVjJm5BWmVriePFnbabeUfEa8tlXS70hhyJ1vmckSlaU
 BS+KfZsjl6wKJueMv/7d57RdAnueHyc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718965229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5MZnkv/q7nJY4HHzW8meFkkO/c4uNlLeBVqHiXc3xU=;
 b=XElD9sJY1R9WBMUd3iaGx9+aAMW3e2FcxopfGqFzHqbne93he4EGlcOVzSdvL79AoTbehi
 0j2IHZzAQ+ZQ1L1hPqIPuFtoFeXuZWA79wy/412oR1ULPV7kqg+zu48kUeSumU0WGU9zRh
 WgGh5zKoE9l8jYBCwId5oH0wtf9B+CA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-yM5pAGgHM9q6b43f2kFmZw-1; Fri, 21 Jun 2024 06:20:27 -0400
X-MC-Unique: yM5pAGgHM9q6b43f2kFmZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-422322e4abaso10285225e9.1
 for <samba-technical@lists.samba.org>; Fri, 21 Jun 2024 03:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718965226; x=1719570026;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I5MZnkv/q7nJY4HHzW8meFkkO/c4uNlLeBVqHiXc3xU=;
 b=wjTXycv2xrzK264OizAjMilSmseOEQfTS1V9DeUKdKNNLVQNs9sFmlJYYJVTTXrzLy
 4CKSYOI+ZeTHXnVVCkBGmfGUqBopOlz+mXyCMmGugehqEpEJ4EKj23gpBUd21H6nWaKZ
 iX5V85fDx0HTJXHHCoUNNindRemauGg8L2/9Cs4N0Is4Gygp69leEOfluln814eV5klA
 5PqPfYTbCLFHc+jWIPoKqMN3iootYEv1mPPCZ+VRK8f+MJrPw2XjhPxXMkiXXwmNNpmZ
 9LQKRr1GNF1eF8Np6bYBM2Be3KAzOMcx38lSYPWW4enHyc2Fom70/QQupKQ4hnIaSwy3
 K2ww==
X-Gm-Message-State: AOJu0YxwkQreaZiGvF3Fc9l4aScNjUYFci1xFgK4F9f3FJJ8iJ+2SYsC
 GeF445x+M9eCRJY7u7gYQXbMGHCxIC8chIgMqDlTs4ysmjF8b3UeqkTuSi/wRt8zbZWqRoZ1swN
 mBGqoLhelqz/5zRSUCSCevusvP5cxswW5F+W9r0J6VlTJFEgxh2yBDFJ0b24mgaAsKw==
X-Received: by 2002:a05:600c:4506:b0:422:291:6b3e with SMTP id
 5b1f17b1804b1-4246f56d2b6mr104200615e9.1.1718965226469; 
 Fri, 21 Jun 2024 03:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Grd/Y3e8pxVkeRvNdbaicIxw4QYMMsCF44TGvW/kvxFENFK8+/ymQk44A3UhvfP5s6NL8g==
X-Received: by 2002:a05:600c:4506:b0:422:291:6b3e with SMTP id
 5b1f17b1804b1-4246f56d2b6mr104200445e9.1.1718965226085; 
 Fri, 21 Jun 2024 03:20:26 -0700 (PDT)
Received: from [192.168.21.108]
 (host81-157-9-97.range81-157.btcentralplus.com. [81.157.9.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638f86566sm1298857f8f.64.2024.06.21.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 03:20:25 -0700 (PDT)
Message-ID: <e20ab35eea44679b3ae0da629cb4c7da1178ea11.camel@redhat.com>
Subject: Re: smb2.session.reauth4: UID/GID to use as anonymous user when
 modifying DACL
To: Stefan Metzmacher <metze@samba.org>, Xavi Hernandez <xhernandez@gmail.com>
Date: Fri, 21 Jun 2024 11:20:24 +0100
In-Reply-To: <35b4b0bc-1e9a-4d69-9fce-ba8782d1ce65@samba.org>
References: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
 <6e9a8ade-8357-4c35-8d1b-c0749503011d@samba.org>
 <CAO9H7P876Qx8wEN_kfYQKUW7XqMWevfqx7A0kAbf_1UJkmu=zw@mail.gmail.com>
 <35b4b0bc-1e9a-4d69-9fce-ba8782d1ce65@samba.org>
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
From: Sachin Prabhu via samba-technical <samba-technical@lists.samba.org>
Reply-To: sprabhu@redhat.com
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Metze,=20

That information will be of great use with updating the new vfs_ceph
module.

Sachin Prabhu

On Mon, 2024-06-17 at 12:30 +0200, Stefan Metzmacher wrote:
> Hi Xavi,
>=20
> > > > At the same time, I can also see that getuid()/getgid() returns
> > > > 0/0 and
> > > > geteuid()/getegid() also returns 0/0. Does the default plugin
> > > > use
> > > > uid/gid 0/0 while performing this operation?
> > > >=20
> > > > I have the following questions
> > > > 1) What are we testing for with this smbtorture test?
> > > > 2) Is the anonymous user allowed to modify the DACL of the file
> > > > as done
> > > > in the test? This would obviously lead to access denied errors
> > > > as we
> > > > see currently.
> > >=20
> > > It checks the reauthentication has no effect on open file handles
> > > only on new file handles. After the SMB2 Create only fsp-
> > > >access_mask
> > > matters for access checking.
> > >=20
> > > > 3) What uid/gid should be set when performing this action as
> > > > the
> > > > anonymous user?
> > >=20
> > > Maybe you need to remember the low level token at open time
> > > and use that.
> > >=20
> >=20
> > I'm not sure if this will work in all cases. When the acl_xattr vfs
> > module
> > is used, the Windows ACLs are stored in "security.NTACL". To
> > correctly set
> > this xattr, the process needs to become root on a kernel mounted
> > filesystem
> > because the kernel doesn't allow a regular user to modify that
> > xattr, even
> > if the user has permissions to modify the file.
> >=20
> > If a share uses a vfs module instead of a kernel mount to export
> > the
> > filesystem, and that filesystem also requires root privileges to
> > modify the
> > "security" namespace, then using the cached permissions at the time
> > of
> > opening the file won't be enough.
> >=20
> > I think that the unix token should be kept consistent with the
> > effective
> > owner of the process at all times to avoid this problem or similar
> > ones.
>=20
> We have get_current_utok(), which refects become_root().
> Currently that can be used instead of handle->conn->session_info-
> >unix_token.
>=20
> metze
>=20


