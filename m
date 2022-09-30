Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C2A5F099F
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 13:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qcDoKLlFVEecatnmfQzuEjVmVwN98715QAm6Zdn3rMQ=; b=tDYshpnTZ6Sk7JfQX6gx9K41yF
	wEWvMXmAkYGzBX/JaHXhkB+2G31Qa22ZMZnaLxh17NF5hnlUxC5ChlFV0O1nWn+VDUizGb/tesQXL
	OqJmp0qfGbThEM0tP6WvuP8bCQSRPMNpQ1fqxwKA+5fJfnYO0edEcXshms+UZNVv73RuYS1Z5brEc
	nOnwk/75PXXvsShTjiw8cjY2CAQiUj4a+yM1MIRpVROj95mu89Bgo74Xjc0eFn+VqtwzX5KM+r8/p
	2875WMuIye1Vz0ZyjFb9zfEWCnoSWepT6o6LrUX9Gm0HuTOErPLyd4Q6MmnPD8xnkgBzb6JWqyByk
	K05fF/CQ==;
Received: from ip6-localhost ([::1]:27818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeDvp-0050of-7h; Fri, 30 Sep 2022 11:11:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeDvk-0050oW-Tr
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 11:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=qcDoKLlFVEecatnmfQzuEjVmVwN98715QAm6Zdn3rMQ=; b=OzsOADgW/lOHZCXE5JpGW1sfUn
 PrKBxscsWOsGpJ9qyQHBDrffpcT+Wv2JIxkGpe7IuVSwVL0DGcoiTWQN2TQpjGDZsG6GFdegrDLWA
 NUptGXVo62BPgbZlwOtYT+nMIltsXHTSrfN0ml0kehHeZejhBshLyjNOVXa9AkAPkXil7jiIZkkJA
 r4zzFZx7ypaa2ZaH4kViRFyIBGIuzm5zPXvCyfIl/1+TyPzCnaIavw1GiVjq9jtowOjTaYdpBwnmz
 Yz7lRCGhrf/iDTq+XgKfFluHp+R1St5c450PfRLzhqn/hsNRQ9ZT9QbmyQx91FPwhiNPPQB495TRC
 hKHg0XxcXjv91cnGtqbki5haSIEGULUag05o+HU2fv/BL6GkMpHiIma8nMY0vqPjaVV/OoMNYTFSo
 h19+A0oHmvXD/+7dsWc6KIsaQb35dEbb+sf0QoagqzKS8cclA9z2nlFcb7jiJrfoQvC5+V3FsoSDO
 di+SkdR2byKXvVOMgcXXftW3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oeDvj-002UBe-Oh; Fri, 30 Sep 2022 11:11:44 +0000
Message-ID: <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
Subject: Re: How to detect a client-closed connection during a write from
 our LDAP server?
To: Andrew Bartlett <abartlet@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Fri, 30 Sep 2022 14:11:41 +0300
In-Reply-To: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-09-30 at 14:26 +1300, Andrew Bartlett via samba-technical
wrote:
> I've been trying to chase down the CPU spins reported by our users in
> the writev() codepath from our LDAP server.
>=20
> A private mail the the strace output shows the sockets are in
> CLOSE_WAIT state, returning EAGAIN over and over (after a call to
> epoll() each time).=C2=A0 That alone would be enough to keep things
> spinning.
>=20
> But they are being shut down, however our LDAP server won't be
> triggering a read any time soon, it is waiting to flush the response
> out.

Why wouldn't it? I mean why does the read waits for the write? if epoll
says so then we should read, then we may detect that the client closed
it end and may decide to give up the writes.

Technically, I think there is no problem to write to a socket after the
peer sent us FIN, it just mean he closed its end and won't write no
more, but we can still write until we close or he/we reset (as is the
case with HTTP 1.0).

