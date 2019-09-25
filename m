Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B5CBDC81
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 12:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=91dmRdfLlQ1+GcF7Wz0w1rJiS2fCv95govBb8iflviA=; b=nd20LRcJsLA6BBaFDe5Frvr8Io
	vXjpR2i5MM8/iX/egpVMO/PhNMYDsKhDbrIjDD1im+lKmpPURDWsymsG5RYLn/LVoVkNjNjcgZdrB
	L9047Bi+swphX/IGGixvgg1xzCrZ4UxaX5WkJuTIJj+oLEjdTqtvaB3XZJDGhwC1ZkCUvkU2HoROs
	2PKSXGwG5eIwS81EQEvZHqPxpGNuOdERBUvzin93XiJ8KDP0546O61uNP1lBF5naD/nlNT/bfJHpY
	7D0K/pn74I4Ouhc/1uyTdcKX1CNjKGfyCPFs/9QRPp+JFF4y+AuWQovieJuMp3VrY6pyz1G80bwxa
	/7Feyf+w==;
Received: from localhost ([::1]:20020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD50a-008Tv4-Uz; Wed, 25 Sep 2019 10:58:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD50T-008Tus-5F; Wed, 25 Sep 2019 10:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=91dmRdfLlQ1+GcF7Wz0w1rJiS2fCv95govBb8iflviA=; b=VjFQ9RroYYKDXJrO3kFAWKnr8I
 NVtWxzXW8and4tUiDZ6ys/7mhLUgGiPvHFZapXc07IBajU2IfuaPbpSE79+YpTfoU+caeAM3c2XOm
 o++vSLvUpS/D4kMYr6rWMlC2L4jCbq7IFuV1tgf96KaIzPs8CBYH5lhoWD461BtNBdRA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD50S-0006Q8-9n; Wed, 25 Sep 2019 10:58:48 +0000
Message-ID: <37da4574d589033cc87ab985227fb7be1b2f1fb9.camel@samba.org>
Subject: Re: [Samba] In mac guest user is not working when AD connected -
 samba 4.9.3
To: VigneshDhanraj G <vigneshdhanraj.g@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>, Samba Listing <samba@lists.samba.org>
Date: Wed, 25 Sep 2019 22:58:45 +1200
In-Reply-To: <CAG+HqKQcLgAw9EFHCqTGkVXEO8FbF3oUjGeOhDEoqS5rRk_YCw@mail.gmail.com>
References: <CAG+HqKQcLgAw9EFHCqTGkVXEO8FbF3oUjGeOhDEoqS5rRk_YCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-09-25 at 16:24 +0530, VigneshDhanraj G via samba wrote:
> Hi Team,
> 
> I have configured server signing as mandatory in smb.conf. After
> configured, guest user is not working when AD is connected.
> 
> In mac while connecting to samba if i give register user as vignesh/guest,
> guest user is working. But if I click Guest radio button, guest user is not
> working.

server signing as mandetory makes no sense with a guest connection,
where there is no password with which to secure the session.

You need to decide on one or the other.

I hope this clarifies things,

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



