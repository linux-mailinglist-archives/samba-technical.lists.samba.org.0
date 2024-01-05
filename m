Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B468B8250B1
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 10:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OA5DUFV9t7B2x2NrgJ53HmKFAwYKOyX/QWR0fQ8p+r8=; b=EqJhQmc9C6pc/6QM+SNAbi7poZ
	j4Ng2C/UpUNrIMR6yllCiXDo1dDOtfFPy0LSzePw8b4/MdzHqqFa0kMd76xn/Y87PM9Fg8KWEP0m7
	oG8uSHLoiZmHwgiri4DW+R2cQC4R4iy0CuCQx3Jrf9lxYMDXK6TwqXQQjcEhUWE/AAg77l9ce5uTi
	GReaOgUIHDU+Ecy8KjkQPsKw8pHchoynGvV76/FtOvtnXccI70sO6aYEqPuL6PRHSXhp288bQ8IDj
	8lO+RX2nCuyYnGpwREif9YUxgyh8nvO9/VEHhRL9Qi/K5a02BcnGE0+NE3jjdSdeNtXkJWWg22NN/
	Fv+D/6wA==;
Received: from ip6-localhost ([::1]:40964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLgLl-002SQM-HK; Fri, 05 Jan 2024 09:18:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:49569) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLgLa-002SPz-Oq
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 09:18:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50ea9daac4cso1539298e87.3
 for <samba-technical@lists.samba.org>; Fri, 05 Jan 2024 01:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704446313; x=1705051113; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OA5DUFV9t7B2x2NrgJ53HmKFAwYKOyX/QWR0fQ8p+r8=;
 b=ggcyYAXm2rGdWII5ZKXDcmKDkzuBTCl6rtd78GfMnZ4j/nXtJCLLQXXNt4kbJdxOC/
 bfKmHtHYSIT01o5GAd+T2XgOSyuafDIaSj2BYXIE95mtG6B7N92MxUjnTIqmu3pojNWj
 5ekKXZrcjLI7Wzaf9fS4zBy45vNegQ7/0KNFdFPxSVyRhJILXhMLTpxFvW3goaoudtQc
 qemGotTPuXI6eR2nL7MWXW+9WQOJ+wTteCEZeeqFu04NHqk8VVM/kkC/vemH18L6WvwN
 MC8qo/reERlrSpZMXpnCh/I2mFZuP97oelpH+gTzF1QZ6rkhXuqz8PMnAhIQO7P2pi+u
 Abng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704446313; x=1705051113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OA5DUFV9t7B2x2NrgJ53HmKFAwYKOyX/QWR0fQ8p+r8=;
 b=oLvqu2OXFv1SM6LU4LvnxVTzyrjzfygPe5xBNo/G9TB+ZYwKjgW5qeT7DtkG6dNpcX
 Gx5N6Ya94ET/vcreDb5ICrqii3jWCKQoojUk1HcW0rYSNYkfzt50iZxInFdMNh0NnM9r
 L6gGO6y3X32uQRBEdIm45hrEhmyxu3N2oAYs2/iD0DLx8Ark9zILGCwkdWCDmPMvh8B1
 Ws6dKN1mozY2n+JURXglvj4sFKD1gX07TJaUfHMfVGH74AFngBgZrT2LupIe26UFKVd8
 TCUosz6BAuTisEz5B5AU3gSh0iJnFR3PaMb4UpSNWuw1ERoINIc6TDv1k+wtmixA5p6C
 VR4w==
X-Gm-Message-State: AOJu0Yz1JloAibK4OBo530F25ShWCXhxluJPU+pZf19wdqMfmSBBZO9L
 o9nW/F/CKe67LhysvKYGq9oqAn3roryEBsBItSc=
X-Google-Smtp-Source: AGHT+IHtLLh+4pplDwoDlvnuVhCQhMlSDk+6FKHoTRYqz/yJHrp8h9Rbbc6AeOjOrp1YDIdDuGoYqZ8M683C4KeZ/Pg=
X-Received: by 2002:a05:6512:3043:b0:50e:aa04:b2ee with SMTP id
 b3-20020a056512304300b0050eaa04b2eemr1124022lfb.95.1704446312978; Fri, 05 Jan
 2024 01:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
 <095d8821cbafdf3f13872f7e9d7125a0@manguebit.com>
In-Reply-To: <095d8821cbafdf3f13872f7e9d7125a0@manguebit.com>
Date: Fri, 5 Jan 2024 14:48:21 +0530
Message-ID: <CANT5p=ocORg70HjR0Ek0HdGtafTs=e=8eB-x9vjEgzNvcjkDwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
To: Paulo Alcantara <pc@manguebit.com>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, sfrench@samba.org,
 sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 5, 2024 at 4:39=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> w=
rote:
>
> Tom Talpey <tom@talpey.com> writes:
>
> > On 1/3/2024 9:37 AM, Paulo Alcantara wrote:
> >> A possible way to handle such case would be keeping a list of
> >> pathname:lease_key pairs inside the inode, so in smb2_compound_op() yo=
u
> >> could look up the lease key by using @dentry.  I'm not sure if there's=
 a
> >> better way to handle it as I haven't looked into it further.
> >
> > A list would also allow for better handling of lease revocation.
>
> It's also worth mentioning that we could also map the dentry directly to
> lease key, so no need to store pathnames inside the inode.

We were discussing just this yesterday. That we don't really need path
names as the key. It could be the dentry.

>
> > It seems to me this approach basically discards the original lease,
> > putting the client's cached data at risk, no? And what happens if
> > EINVAL comes back again, or the connection breaks? Is this a
> > recoverable situation?
>
> These are really good points and would need to be investigated before
> coming up with an implementation.



--=20
Regards,
Shyam

