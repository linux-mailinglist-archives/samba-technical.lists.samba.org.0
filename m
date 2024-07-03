Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2818492633C
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2024 16:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XJAb27u6UPk18mDoLzT7IfzGgE1xbUSOSfQyk7MQ850=; b=2pqPsRdKcjaidfv7O5iLKRroUA
	BWT4zDSxO5XXKDwe0fYwZC4XQPIWJ+fx4bV3fZCLc/wiXRtzDZU6UXf3hj0aiAp0iHBIc/7YaRVOf
	i6wwY0hOwoe5rNINWJV1lLuomZFf0CGGM5Y1kI3K1/h84oSS6WlwtIN8XUd542g1rPvnk8moaBtvh
	MoBjwOKTu96pPN95BrGNnCeOOk30MgdOLSSTsbT4oGk8R22CCSmh20Mshq2ujsXI1pcaK6jZmLt0C
	WPOCFCczF6ZjgY15JpzOzrclz4/c5JZjtt1rXp0hb5bYySpAVMu7q0oXSfFMyLwrNLB37sUT0RSXF
	QOeyjcMA==;
Received: from ip6-localhost ([::1]:47126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sP0pZ-0039Uf-Ny; Wed, 03 Jul 2024 14:19:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46342) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sP0pV-0039UY-11
 for samba-technical@lists.samba.org; Wed, 03 Jul 2024 14:19:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58b966b4166so2532962a12.1
 for <samba-technical@lists.samba.org>; Wed, 03 Jul 2024 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720016368; x=1720621168; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aZfubdvNaB3aHDBS5zkTCa3VGPb7N0xi7+7/cB4O2HQ=;
 b=P0i9pmYv/VLOyLf8pjEwUGL0NUtsIxDVeQE/iLjFeWgcTTVapnlA8rkRm6+cbsVzJv
 JaK4GC5naGsnho5mXJokdcH8HapspmAmV4Y7NxPXdw7xOFjgy8h/INN3lc2vQcZeG2rv
 16hkAlS2bWco2hrUTDh+FKy+CM622empaDES4ml4mBS7wxC9K2CD/17XtjcSIq1vX9Bh
 AyAN/aolbAsKQHAcY4Ymek3NyZx+8dmS6xkWMMkin0AEqn/6FMm6ECYgBisprMFYfTx3
 QvMRwQoaNRrKvwjMIvWWTx4sDi8ZcwCcgvdlY+PenmdsB3iOo+5bcZi8LblhQoonMahT
 xRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720016368; x=1720621168;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aZfubdvNaB3aHDBS5zkTCa3VGPb7N0xi7+7/cB4O2HQ=;
 b=C1eJAyoBo7Pv4u4O+08YqN0DMPnFYLZdtJsh14XxV7F5fQx1aLz63KszQ1UaWM3kH6
 WSI7hxk/7qlj/9JoQ6ebvdP9VBZerKVSi8jDM0p65/ydMfbNLrlez7q8JoT7eWc/xuLW
 ITMN3vX8W/7+Li6bIi/C0fcvPEsMIkIOoIrpddsFEMJPRM/myB1T/ewilOsCPYHvyuov
 A5Ep0480MJVibeJItVzvFUlBai/IWPOJtAOaejawvaF3tgFyFxYjGE9pl5h9ua6OfaEA
 J+icJ1PVeaLhCdlYdqMfuHnpMM8t1YWJCNfHeg59Cfsm1CRUjvPuGYaLxtagYnkEjvfe
 SXkA==
X-Gm-Message-State: AOJu0Yye4z5MeVTMucAlH2pLsjxmR+apbTTa9dP1kZQ/+wcjsx8PU1EZ
 w+ALCM+Ge0xKkoxAEjfTtbF7qBHdkoSMeLWalOT3VMfDi8ZraWeBzp5W0pu1vu66ZbGy4mpE0X+
 MDsd2SOjPE3XJC0h+588VbpqzvHV+azyyfxA=
X-Google-Smtp-Source: AGHT+IFiXOzDK5ewsknpdgcBMgCAMacRjjHSvyIqZ/CkLQfNFNW9qK92m1sC7ZmXs6LD6JefXpCmaswywD5YeOJs9n0=
X-Received: by 2002:a05:6402:440a:b0:57c:b7c3:99f1 with SMTP id
 4fb4d7f45d1cf-5879f59a549mr8379301a12.11.1720016367970; Wed, 03 Jul 2024
 07:19:27 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 3 Jul 2024 17:19:10 +0300
Message-ID: <CAAu4aPGqo3mcJgNPV3MNGKhBmG1i95uaBEHOMKwRLQBM1znMSw@mail.gmail.com>
Subject: Dns update failed with exit code 110
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Omnis ludis - games via samba-technical <samba-technical@lists.samba.org>
Reply-To: Omnis ludis - games <sergey.gortinsc17@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, please tell me if I understand correctly that the dns 110 error
occurs in the samba log only when it is not possible to update the record
and the error occurs due to a timeout of 10 seconds in this directive
DNS_REQUEST_TIMEOUT 10?
