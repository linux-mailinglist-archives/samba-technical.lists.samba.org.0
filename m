Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC96E46C
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jul 2019 12:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=orG46PIRL7oIq8o0g0sFXhS93zCFRqlpUBA4oRqECqo=; b=zopmZMQZ4zUpcypQqDVjLbVXF9
	ZOOU4qM20OWXLseHdASUUsOQSxFu8yEp9jm2pSmqd3XxKhY49gNi3MrLrpiAgwYSInhbYnchWcpj7
	gpdfJoWVxjxnDBiO1pjqAAtrAxg1h571k1/dJO1Dy7wLXiVhueJYzIRT9mu6coili7I1kUA8nQqVD
	hhOLElDl8DrCX701fo+TV/QCrQXq5Zq60IGMUNvYNI1UvNQfVGhLe1uN/IcAnFedlaZNCNU0eaWRP
	7ZK5Y1v83Cp7zhCpMNmySxhdyxp8e2oJz1Fnf/bqdOmmT0Izik6DCVPoqWsoDrTkKzCDEonP1etcN
	CTsIDU/A==;
Received: from localhost ([::1]:50138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoQH1-0017J3-OO; Fri, 19 Jul 2019 10:37:59 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42799) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoQGw-0017Iu-M3; Fri, 19 Jul 2019 10:37:56 +0000
Received: by mail-io1-xd32.google.com with SMTP id e20so27038607iob.9;
 Fri, 19 Jul 2019 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orG46PIRL7oIq8o0g0sFXhS93zCFRqlpUBA4oRqECqo=;
 b=e3WuA7lIfNK4WUdekupLDiTRHxSZ5iWL4sSGMXl5kU6IsLu3s5BRxAHIdqop23HBxR
 mmNEJHTbi4xfrpuvEIUcu615CM8l1rpKqZKLQl8ON/8bta5ybEFzhBRBrw838hBM8CXn
 t3KwkpMMZc6sfoEyQDp/Q4gsYtUXFIbp94UJ1vN7vFp2s6QvoyIPAwDSeCZyo2uNsfCL
 qNXCWEoZIm44aYciRXjHe9V/vTY2bfSZjQCRSJL+wHQOOMouk3Kpope9BSPgndgJZUt1
 c8OMRh2CMj6EJWgZ4dqP5u+Isu7lWC3gPVN3Kih1TbNUzuSxpPZ57J/c3+PferWybh7h
 jvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orG46PIRL7oIq8o0g0sFXhS93zCFRqlpUBA4oRqECqo=;
 b=gKnJxxknkaaYgYJxPrbCzjXahVWCyvVNOXnt9WoWGw0xq76fl+3lUKangYpqwceiAa
 9d4NU7ymn0o/pUqgSFZK9rt80Jz2qcOLeI1sX6eFrZrKFsf7najBFS/SC4DqkflYUbTs
 JDMqn8l9wqyRJh6o4ioqtZe01EuDLKs6qxCyZk5IOkawrcYSPWl6Hl8iOVfFiKlya8kl
 y1XGIRXDjmQQYX9wh3QaOSVDgj00FIa+sr35K9oC4xGwaACCz93FD1BF42F25YLGO7fH
 /wQfVQKA/wJDMRtLqzTMRWq9NAyk/gadng/h282Uv4pAXjnI2pVAtrQuGTJEsRE3i/vj
 +M4w==
X-Gm-Message-State: APjAAAVhy/nhsV0TIgz6SZxABi59GF9DDP7j8QVJILSbCE8yT+OlpKpW
 eADiF7hMI03KrFyOW/XGp/2of302oejKIJV5Qyk=
X-Google-Smtp-Source: APXvYqzVCgqL9X9JCZJNPdCcdHIlVXHYx+DHeMVqp4Pfn7oDaMi2jKVORaDG/hNOREKrPaJzgXenkV4OVZDJU4JTto8=
X-Received: by 2002:a02:3f1d:: with SMTP id d29mr57418200jaa.116.1563532672413; 
 Fri, 19 Jul 2019 03:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190710225121.GA142072@jra4>
In-Reply-To: <20190710225121.GA142072@jra4>
Date: Fri, 19 Jul 2019 20:37:40 +1000
Message-ID: <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: Jeremy Allison <jra@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: samba@lists.samba.org,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good stuff.

Next step will be to delete the entire smb1 codebase for the next major version.

On Thu, Jul 11, 2019 at 8:52 AM Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> In some small way to apologise for linking to twitter
> yesterday :-).
>
> https://tech.slashdot.org/story/19/07/10/2119238/samba-411-removes-smb1-file-sharing-protocol-version-by-default
>
> https://www.theregister.co.uk/2019/07/09/samba_sans_one_smb1/
>

