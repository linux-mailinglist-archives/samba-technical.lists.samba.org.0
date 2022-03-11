Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9D4D65F7
	for <lists+samba-technical@lfdr.de>; Fri, 11 Mar 2022 17:21:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=km1QIlV6rHidiw2QJ2kCxiYKTbyNV9oMepFXyi8KzdA=; b=FVy34PiZhY/ZM0q19AQjmgJNYW
	Q0akcdU1GB3dJJ0uWsplXciPH2CaoGgEsbirlbACD5oKNSDZGp6VapKVakyqhxOHdEcRo3WzHWI02
	o/gsifmnHgtVccCH/QKjSOLpUp0UCg9O5FRmIB4RFq7zKqP1NSRWG5KgGHHmXD4U/I1J3/N8pkIRA
	xLncN1P/f+RNPbr09ZsLIxsQtloqI/VPmC4FxRNRABz7ks6oosNM2QsD/Vv5+gWOjoqbhoBCLYrhG
	xv8c4NZDeAynO+/WKLPh06fBMrZNkFILRrc+sapOxL7/Y/yTOdWJXu2kEjETmn7fHhcUKnWWFolvB
	cTd6E7eA==;
Received: from ip6-localhost ([::1]:43138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nSi0J-001mUd-Ko; Fri, 11 Mar 2022 16:20:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nSi0D-001mUU-Cn
 for samba-technical@lists.samba.org; Fri, 11 Mar 2022 16:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=km1QIlV6rHidiw2QJ2kCxiYKTbyNV9oMepFXyi8KzdA=; b=xROsVKQ7x1VF0fkrqIEaFoGnuD
 aNktuRl7VD1cfymsy4tXlm4xpPf0IiOx5i0NhkFLHWk7V5PDVIWUiiYoAJm58Lr9/EcHF1/kbJLyS
 w3am38UhmfJSRvBsZEY67ticmJ3L14KgX0lUkBlmLq+FwZV8QtPZfRd8n2yCd3w/Wagoz+h9Kk/ZX
 LL+A4BmlocnVjxMe7kpxk+Oua+Z/Xrsbi4Yg/4DEFQ0ltSb4eYGVfQTHefNC1RzLTAkRvqEvX+Wlj
 ++WkIWK5J0g5IU0SKYFr/ZfaB3xqsCvfpH+SByHyQo/6QE4zPGnsEAzVmZzq29WYadkIjvzbFGMm+
 E/xWHzMV1iSxa7OabWy1Toyy5wu85cv6QjNnFq2uHSZhHvEF4VyceGpRuuK35rAvCNyPvtU7nv4m6
 tPIJN+LXda2fP1kfbzCm1aEFYycyDUBfhUEfBu0PlL8yuA1RXfSuZ2yBZcZubply/haT9pgcYFyp0
 re/4zOlLB2/6ScqkPvODOgPb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nSi0A-000vdM-JG; Fri, 11 Mar 2022 16:20:26 +0000
Date: Fri, 11 Mar 2022 17:20:20 +0100
To: Joseph Sutton <josephsutton@catalyst.net.nz>
Subject: Re: samba-ad-dc-1 CI job is slow
Message-ID: <20220311162020.GA1054246@SERNOX19>
References: <abca441b-aae3-5a1b-7415-d596bc4877ea@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <abca441b-aae3-5a1b-7415-d596bc4877ea@catalyst.net.nz>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

> This is a heads-up/warning that something has been affecting the
> samba-ad-dc-1 CI job since several hours ago, causing it to run more
> slowly than usual. All Samba CI pipelines are currently failing due to
> timeouts as a result.
>=20
> Just something to be aware of if you're going to be running any pipelines.

I've just recreated our rackspace gitlab-runners and changed
to from '8 GB Standard Instance' to '8 GB General Purpose v1'
VMs.

These use Intel CPUs and hopefully all support aes instructions.

With the legacy '8 GB Standard Instance' we're randomly getting
VMs on AMD processors without aes instructions.
I'm not 100% sure that was the cause for the problems.

At least the first job in using the new runner seems to be fast again,
see https://gitlab.com/samba-team/devel/samba/-/jobs/2193522060

metze

