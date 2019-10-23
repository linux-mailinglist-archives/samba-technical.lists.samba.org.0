Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C0E11D9
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 07:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aYIkQsOEFwSSaAPlMTDvQ306MZXlogLD+hcrsYfpwgg=; b=rOthFy5S+xoS2VBjLI4i4/hssv
	63mwxWnrYna/GKqxAqXfRkQttEaZ4Cs35g3xRFCosKaTMp3wCU+EY9cwUdfSv+tf16rRvb7iDD4X9
	o9madg56dGWtDLTVNEyHFNJRuLoATIRyc6oouW+6NIFy8+68hPNTw1NiNX/tFUboip8lG2Uz6vxmZ
	QgX4uHLc8Cdr4CJnM+xd7WluXeIRROa8iRrjGUJMoI4uzDQQhLBXjXquiieZqYJvkaG+4L6vWRJxE
	akHIWvq2nYhy6qIgo6NtkSRx8XwNUCitFTdbPbXDx925HFFe1aD/vS4zLqp6bPUiZIx71AjAuYjPq
	bdgdFdfw==;
Received: from localhost ([::1]:29414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iN9Z2-001aO3-R9; Wed, 23 Oct 2019 05:52:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25126) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iN9Yv-001aNw-Lx
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 05:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=aYIkQsOEFwSSaAPlMTDvQ306MZXlogLD+hcrsYfpwgg=; b=0ylvY7O3g+SzsQLhXUoEKvEMkz
 6cop6PjjE93Ufeyzyj80aPk9gbx6RrVxJoljDan6qHgvEExV1/MqMwSQPmCQf7F2XJjylcaHBRUqA
 2pwpF9rV53NaAGJJdb48jjNeuxnRZabrWswohpu80zvTYamxF+pbAv98IV9+1CEJP5mg6jyKcWvh7
 zThBfIn9KVrPsHLDDwHn/jufCuzCE6h9QxesHLklW2tC1SjJO1TodVhwFEzzOzAejvbfZujVQqtKX
 Lk26A6Z8IKqz/2Alx4JH7aVzzkmuwBMIwuXTooCfwZjzB4AGsbwCiYULB7NVhoKY0eKnoItt+tC/j
 oGUzGm5LhmX1y1Pf1jBP8uzkv7OLD+oxVEoRrrSquA/ivm1fvMo9daAiThviN/SDkJ3c/DksZJSNW
 S5YTp+zXpGS6tLlG+KHMSfRMFaLkEZOhTZOWlju7/zuF1VqQp/b85EjOjCCUtA1fHryLIijjHcH72
 KNA9mZ0XEg+Ymhh79yAMXdVb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iN9Yr-0004tF-M2; Wed, 23 Oct 2019 05:51:57 +0000
To: samba-technical@lists.samba.org, Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
Date: Wed, 23 Oct 2019 07:51:56 +0200
Message-ID: <1862579.bBNgSl7iVu@magrathea>
In-Reply-To: <CAOCN9rwt2UN1EYN586zEjtPTWVHz7TKoc_xNgcpcz7d1ivvBfQ@mail.gmail.com>
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
 <CAOCN9rwt2UN1EYN586zEjtPTWVHz7TKoc_xNgcpcz7d1ivvBfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Denis Cardon <dcardon@tranquil.it>, Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 23 October 2019 01:53:58 CEST Nico Kadel-Garcia via samba-
technical wrote:
> On Tue, Oct 22, 2019 at 2:14 PM Denis Cardon via samba-technical
>=20
> <samba-technical@lists.samba.org> wrote:
> > Hi Dario,
> >=20
> > Le 10/22/2019 =E0 12:17 PM, Dario Lesca via samba-technical a =E9crit :
> > > Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> > >=20
> > > samba-technical ha scritto:
> > >> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
> > >> andFedora setup at https://github.com/nkadel/samba4repo. This setup
> > >> usesHeimdal Kerberos, which eased the gnutls requirements and made
> > >> CentOS7 easier.
> > >=20
> > > Thanks Nico
> > > How can use your great work?
> > > I must rebuild all on my system (Centos8) or I can use a binary repo?
> >=20
> > I just published RPMS and SRPMS at
> > https://samba.tranquil.it/centos7/samba-4.11.1/
> > https://samba.tranquil.it/centos7/samba-4.11.1-srcrpm (note : freshly
> > baked from the oven, not yet thoroughly tested). You may try to rebuild
> > the srcrpm on CentOS8. I've not yet had time to look at that new CentOS
> > release.
>=20
> RHEl 8 does not include "quota-devel" and some dependencies such as
> "libtommath", unless you build them from a setup like, say, mine over
> at github. You are certainly welcome to any useful parts of that.

RHEL8 **does** include quota-devel, CentOS8 *doesn't*.


https://bugs.centos.org/view.php?id=3D16549

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



