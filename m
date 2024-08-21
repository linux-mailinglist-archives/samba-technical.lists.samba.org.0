Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66195A221
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2024 17:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eGNGO2uvY56vUZH6mFvyOPdmZDbNvIRo3dnZ0pU/ySM=; b=5rjel0GiChOnFarOR1Vjz9mMxU
	PF+4s6m7Hbcw3KrgdYWZm60ebPC74pNOrAcODIt56XU5+QFts6DycpkFFXg9mNMBQnS1RldhrEqb7
	55wJiWdEAH4sYCx0YHtSdPgJA8/LSFQjQUYwJ4STH9EAIUP7o9HsVTwrLsQF53PdS7dGGCwoCrpOO
	i2pywn0UXKfaVkxNvHhVsLGg+qtSFQua2NKd3fUCjdt5n0gfrgq+m/po2hdL+kYNsBkoal9sW74JX
	Nyi3qP00IpZ3nXOn9zcLSCy0iZqugdfbF8RQ6+jB5xbbcwrBH1g06Q+GtawSDA9sEKSgGlfspCPK9
	Tye+cO5A==;
Received: from ip6-localhost ([::1]:59186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sgnik-005AmW-Er; Wed, 21 Aug 2024 15:58:02 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:51630) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgnig-005AmP-E8
 for samba-technical@lists.samba.org; Wed, 21 Aug 2024 15:58:00 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-533488ffb03so1176465e87.3
 for <samba-technical@lists.samba.org>; Wed, 21 Aug 2024 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724255876; x=1724860676; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eGNGO2uvY56vUZH6mFvyOPdmZDbNvIRo3dnZ0pU/ySM=;
 b=WRiKkfKhm+EyvrEITnGhs/1Fj70ZsjSx9dHKHqiRG2u5uv0IIBRsucgA+MoNNyrav8
 UzbW3oIfudxjqcSDptDr03shloB7Tp8I8fpFAVBBRJo6ST/TeFex54DlLwBTsSp3HxUa
 SGrV8w+eBQQWVy+B/Ex9FhBWMXa/zSJSsxusFKWKvh+RK/4NHF95hIei3KiK145KQBH2
 cdyDvMgHqlo2ktIkmcMurq16vKH4gaMp3Xrsn6CYlzsXyWtqzxmQj1/BELLj8UeBwy6w
 ZPptvy+UVOpbr2rYpBbhNfxeK03IqTVcEZdo5QU7KuOAAGRcchQ2BMB88VlsejTizQiB
 89eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724255876; x=1724860676;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eGNGO2uvY56vUZH6mFvyOPdmZDbNvIRo3dnZ0pU/ySM=;
 b=j0KQwUzF3J616nxkYiv78S87Usq3zWd4x4iw4u/tLP4aOWORpHfP0ypcfe1ksthjZO
 QUxQahe71e8g23+a9aYT0JL6MegbY1WnI366DekSYVgaBe5hRoW9t0u5jQsVZ/mimIRf
 KIhgoFv8qvGrOHlTVzPkYxAAmWRmO46sn/2NAtIFAV8h9kqaw46t7H5SDCOSbo6R+X9A
 hlB1R0WILdJFfoI0ZOcq0DlapYJXAn+Kt0r9D8kYisH+NKpd35XrnJofOSi8GR4m2uO5
 laZ2vjogrT15E+oVej/ehoifItBAeTOTFzDsfrFxzNDzX1bmYqBj5k8EbodflatDmZHu
 v4GA==
X-Gm-Message-State: AOJu0Yz06ZN03UF6iQ7de0HilSErDJBxBPGuSCzCZ841yE4QGuKn77D9
 4GZtgGDZz2TogKyw3Er0MD785mzCEirWh30lmOhUatadPqh3nscVlp3r/Ta8DkCK/jluY4WjyiI
 e1im/T/lhvZCGLIh9vE/kGBaAD3r296wS
X-Google-Smtp-Source: AGHT+IF+0hEFmIUeAhcvxa3+ecoDmFJ+ZGPVQR7RCXbLBMk1PmvbmpDXchfmRSTemnKkS9zHDvmQ6JRkqDGDH/za0EQ=
X-Received: by 2002:a05:6512:2210:b0:52e:f2a9:b21a with SMTP id
 2adb3069b0e04-533485545afmr1653090e87.19.1724255876267; Wed, 21 Aug 2024
 08:57:56 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Aug 2024 10:57:45 -0500
Message-ID: <CAH2r5mtUTOFgaQMbsWwkAD-XDRiVwyAGT=Q7n9i5Sd6Wf=9q+Q@mail.gmail.com>
Subject: Samba server multichannel session setup regression?
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Mounting multichannel from Linux to Samba server on localhost
(even current master Version 4.22.0pre1-GIT-8edb1fd13c1 but I also see
it failing on Samba 4.21 - but it works fine on Samba 4.19.5 and has
worked for years)

I see many repeated:

[ 1936.825332] CIFS: Status code returned 0xc000000d STATUS_INVALID_PARAMETER
[ 1936.825344] CIFS: VFS: \\ Send error in SessSetup = -22
[ 1936.825353] CIFS: VFS: failed to open extra channel on
iface:0000:0000:0000:0000:0000:0000:0000:0001 rc=-22

trying to setup additional channels.  Any ideas what changed?

-- 
Thanks,

Steve

