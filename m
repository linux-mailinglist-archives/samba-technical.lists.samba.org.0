Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 482AC75C58
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 02:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=aLk4+3q9aDUxT+5/J0P27rMvagT1DUHV1u3sTi/v1Rk=; b=vfLnp188aX0hn0/ZkEjtm3FKL9
	KVFWIdVdOBXdb5qSDk5Mf3f+KYtF4OKtZybMjpaeGP8n9IMiOiAuBezfh9iP20P7SNGNaYPyRjN7N
	iiufCtyTWMnUmXs4fIy94VARhOxUfhCfO4yKqMV/4PlM2tt/lPME6cpRu1sGtgoP5oIi1AQuh+LD2
	uDkrw5rF17XRwGErd4qdegMtP4agRxmz4npuScGxl6MNVuRw9r5ew/Oyaeyv4IRDx9ACQKZpCTN+1
	MZGlL+peJmcI0TprBZwZnZ9ujFCqr52PfFIaGOhcjlFi7vWCNDs2CJP9tA2QFU/DiHPWoEBUc69V/
	IgOyaGTQ==;
Received: from localhost ([::1]:42478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqoYd-000O0C-UT; Fri, 26 Jul 2019 00:58:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45429) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqoYZ-000O05-F4
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 00:58:01 +0000
Received: by mail-pf1-x435.google.com with SMTP id r1so23595932pfq.12
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 17:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aLk4+3q9aDUxT+5/J0P27rMvagT1DUHV1u3sTi/v1Rk=;
 b=hKMbnVZEVmkzKh2lNEI5unwFFVLvEv36C3u8hKCVLkX5zuuHyE3e2jC32PN5WkJz9O
 AU6wht4VOaYljd21gJibJEZHRDoY6sawQz6IpTQ+9gqDsm32rCXvPjHnVqhyjDPx+KB1
 oMW9xc42ImCy2Iq76dII/O+9QVM4FLjpJKMl+Soti3CyWQEfI/68KtHM0Npp8JvnLp4n
 lrIyekWpu9YqpCldl87rJKtvNb1Fb6ck7okZixWUUPpz59dqG1wZysZtdQ22mwuqvA6p
 gvRs9b07Rq23zitRby7thd5XL9E+NOqPwa6Jnf5hnkg5P4S7x0/z2GLkDjVhpfB/poiE
 Yk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aLk4+3q9aDUxT+5/J0P27rMvagT1DUHV1u3sTi/v1Rk=;
 b=EaUbLqh/nO/FxBEx48+FxwgtZWAVaAC1CsQBh1u1WIj2ihfStJ4ZMgv0P6tFNdd/38
 65gKvzCJ5t4kOmwaNUUpz6jHCggfMoegdr2WmaieaKlzBIi3TQrgFA1xmTICRKX91ET3
 fO9UhYDmYTHDDtpekJtx6o8gUzjXau39op0dGaBU9R4UDBG3oly91WTjuZ7ZILlDbNX7
 lPkBxIBPanmYbffaZINdONTZ/TGPakjFPGo2Wle7OArekHnyoyqaVeR0PaBIF00VyZqz
 2MGVxJL1befOrmf7u64qcBB7siKS71T6gSDBguLpLUJoQIMY+ETud1fSMER4ebgfvxXh
 szqQ==
X-Gm-Message-State: APjAAAVHtE/7UQK9WNow0RQ87tI2ZtnMWCqCzA9UCVrKtvqqNB4FfTij
 7OmvWEzIzYXdXV88iqADUXflqeIGMlnER1pdH1DxFHR3H1axtHUkugF4aaIfDTCO+vw60QH2Obf
 N/GZdBdPhBxmPVYSBO39Xz8+5YJXfbSeD3TcUF5ZCKG9iofKBI6hV0hxeRH1VCItuor/dMHhlWd
 o7xhsw
X-Google-Smtp-Source: APXvYqydrVN2stoLBj/gIDfx+1eB5lt9G9uUM2VxK936dTtIU6pfFAOJbc9ypcyNyNHugFknca61uA==
X-Received: by 2002:a65:654d:: with SMTP id a13mr72592647pgw.196.1564102676702; 
 Thu, 25 Jul 2019 17:57:56 -0700 (PDT)
Received: from ?IPv6:2600:6c5d:5900:1e6:150c:535c:e4bb:e352?
 (2600-6c5d-5900-01e6-150c-535c-e4bb-e352.dhcp6.chtrptr.net.
 [2600:6c5d:5900:1e6:150c:535c:e4bb:e352])
 by smtp.gmail.com with ESMTPSA id c10sm9033267pfo.36.2019.07.25.17.57.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 17:57:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: Turning off SMB1 make slashdot and theregister !
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <CAN05THQyQVOCUSwLrtoQoR93_ac2+uGfzots-3W03uwnJGvgXg@mail.gmail.com>
Date: Thu, 25 Jul 2019 20:57:54 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <DEE3294E-5EE9-428D-8F60-8EAB709CABB3@ixsystems.com>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQyQVOCUSwLrtoQoR93_ac2+uGfzots-3W03uwnJGvgXg@mail.gmail.com>
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think we turned off SMB1 by default in FreeNAS about a year ago. There are=
 quite a few devices exclusively using it out there, but the number appears t=
o be decreasing. The general user response was criticism of the vendor that=E2=
=80=99s SMB1 only rather than of FreeNAS / samba.=

