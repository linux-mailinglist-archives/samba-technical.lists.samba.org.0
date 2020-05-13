Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E91D122F
	for <lists+samba-technical@lfdr.de>; Wed, 13 May 2020 14:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+0xK3TWA2SfP7Em+unav+D3hk5h5HLij0zphaZJOwOI=; b=LBo6CjyqTCtqEQzWrhXH9/V0GM
	M5Nz78q0fYuHktdfiP3V0IzZMTDuM3i9mt5RzF5LwDH6IL9FRlGOTwYoCuIyQWV7KA0Hc+7KlJWcp
	dwbsX//DuaPYCJ1O7NzgYTUhfzYjiX4g6Sf5+hI16iBvE6gjpj5NcbtSk6412QdeI38EXQ7Lh/aXO
	1ZCtuCTy3A3OkKlafyFq2EpcTGsOj5p6JAM4ZQyRO9gDqRzyvoRuPKYO1y222cEDQ0Yub6abFwSGO
	ULtQ9m5pGnzcYyu6tEuaoVtgkQn5rcgECh3iY3W+ttIb/7RuSupa2Wfeti6cuS9I9hgGKztENrUaJ
	tGgU+0bQ==;
Received: from localhost ([::1]:34638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYq7o-004CcQ-7o; Wed, 13 May 2020 12:04:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:35276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYq7j-004CcJ-DE
 for samba-technical@lists.samba.org; Wed, 13 May 2020 12:04:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id x73so13402470lfa.2
 for <samba-technical@lists.samba.org>; Wed, 13 May 2020 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+0xK3TWA2SfP7Em+unav+D3hk5h5HLij0zphaZJOwOI=;
 b=YsPZAvzP66WvyVNBlHw/dUQ2/7GXcuo15eryaPMTH2lk8MsNIMYBZeX5pi04fPixtU
 4D4tfFVL8zaKO7twdXbzKxaqwOJoUOwSTirgpUsxooGgZrDUIVkQyKgzJuB0AVQSOg/C
 mBwmjS8BI71icxmdWx4a4ek9Ho61Slgx7TCN72h91Yaz/2yFlPHmKwYOWYJOW6etL0Rd
 yj5OYpKnBDXBEoe1B7DieGbwRaNmudPoeYYS6q7GXa67PXzRNzLVeOfByRIlEAnl+a0Y
 4D5SaxsMSyrohNuuwpA+xBs/cKDYlQxr3uX9FdcttqxEzTWxBKh+ARrht00MmZzVxulQ
 d++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+0xK3TWA2SfP7Em+unav+D3hk5h5HLij0zphaZJOwOI=;
 b=qY/h8uoNWDeDclAcfQtRdaarr2fno/+x9u29yF+IqRGutOo9Bon0gRksh6HeKOtHnn
 yEECS2ffmOoPta3A3O6OuzIVflUFRM8C38DcI7Af4HYrhna1iR7MqaMaqT6XNURYvQW3
 q/MtaP8GT7Wm1CCcOD4eNJHKktq4zXULsNrnXsFHtGw1FgkAqn7GErgoW9JXXEpY7i4T
 S9n6PvrwWsDJwCZ1+4SHdxWUd+o12SxOJEH2eZFgZzrKN5HqZ6wKY1QrS/qB+vm3oPKW
 qSjYbrwk/G3KpxKNZa0nFxYg9hwI/A1f5a4q4ThJ02VGZg3B1ReAIercyBrjASNS2W7a
 ASdw==
X-Gm-Message-State: AOAM530hHuJSAMCBPGm+qtmCz0dO42MAk3s8apprkyTh5I0jSSVmWgAP
 tgj5pr4FXFoDHZbuD5S3JEbl93Y9i8qP96WA1VdK1YGh
X-Google-Smtp-Source: ABdhPJyUpdi/xqtQFLevNUcH7G9yIXpPkHXbnNz2lumoWS0Cg22+/VJ3QwmSc5+yEIRUWEadtmPDOYp5xhlK2btKqec=
X-Received: by 2002:a19:711:: with SMTP id 17mr2005953lfh.211.1589371469681;
 Wed, 13 May 2020 05:04:29 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 May 2020 14:04:18 +0200
Message-ID: <CAC-fF8RXmP7vE+=P3QQiUAzBL8SvQvdFrJOsEnGt5vb2jrWe4Q@mail.gmail.com>
Subject: KDC Authorization logic of S4U2Self request
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

This is a follow-up to:
https://lists.samba.org/archive/samba-technical/2019-February/132340.html

In short the question was whether the KDC should verify the PAC of the
TGT in the initial S4U2Self request like Windows, and why.

I think the reason Windows requires the PAC in this S4U2Self request,
is because it uses the PAC in the TGT in order to construct an
authorization-token, which it then uses to query the impersonated user
in DB.

See also this article (i can reproduce it by adding deny perms for the
impersonator on the target client db entry):
https://support.microsoft.com/sv-se/help/2009157/kdc-err-c-principal-unknown-returned-in-s4u2self-request

If we'd do something like that, then the PAC would implicitly be
required and verified. But I think we'd need changes in the KDC for
that (both heimdal/mit).

Thoughts?

