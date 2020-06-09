Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B01F467E
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 20:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=rDmoyzu7R8SHdi7auAYcNAK8jl805TEaJL5MXHBN1MM=; b=sqHKJHCES1XtcsuWotKPF12rt3
	jagYupfJebkFSbRd6zyegntrLLUcrJ+KUMOXqvo7pn/QE5a8bhL+FT8p3mE24mf+mcE9Htxhotdus
	T6bdVvhMSInUWe/gdSH72McJO9TvWph2l3+Np/wNJRGX9wnYvCWrLhY1TlomLsf+v8lUjlxUjNRAC
	Lu5L92djKo44Pf8Ie3ttTN0lJwgaePElBucgSegFn8hiCgStLEWl6HsjpETybY7BjuC5H+xUVFts2
	4TfVkTZLLt2cnO1ujJjMzDzR6kowhogeoYF4xiHz9m9yCShjtopGXPoLQN48SkpWvreA+rbYpxxEx
	xAJ9/7XQ==;
Received: from localhost ([::1]:54792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jijDW-009eAg-HB; Tue, 09 Jun 2020 18:43:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18150) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jijDR-009eAZ-VC
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 18:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=rDmoyzu7R8SHdi7auAYcNAK8jl805TEaJL5MXHBN1MM=; b=YM+Kt6pQfoXogTAsmtFZfjkRWa
 HPxMTjA3mTchppFC1hj5G/vNk4nNPc1NxLg0Vp6H5KFGJrRB2oU5qCHb07cZNB9Sf//VJOhulG5Gd
 HZNP4PyLNxODlvtrDcZYRaeKy+mdf5Z121WyDoJBnJt1eMJ23nMlN5zakbdWyEWGxTImBIT4dIs3c
 efYyx9Q3qY2moLxleqerIm4YDZT/8n0VHF8075ZIO4FoVhAVBvrUL9sNb4zsmaIHrqyAfe5jndsOW
 lFJf729P295ReUY0HrIrJ3XW1+xnS2i89LrNfQH9DmZMEigvHbDVswZgrUJfWKVenh8P9wVTR1huB
 CLI8XaOD5sTJLTfgmbbVuGxN9TQ6ab41Jd14e81iQfcN1A4+v6W4Izi1fU8s4q7ndj7SuyxtX3APz
 rBDY7PWthYi2ZbrHj+6xgd8v/2eYj6urAKiVcoSXWeDuf7R0NCxmEz1BQaPqIwuaZOixnlZ7gcC7T
 60oFlfAzUPEvsgwDuoQJhyzY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jijDQ-0006NE-Ee; Tue, 09 Jun 2020 18:43:17 +0000
Message-ID: <a58c7575bf4856e9ad04dffe9b23e4b4ca1bfec2.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>
Date: Wed, 10 Jun 2020 06:43:11 +1200
In-Reply-To: <20200609184019.GB8351@jeremy-acer>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <20200609184019.GB8351@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 swen@linux.ibm.com, Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-06-09 at 11:40 -0700, Jeremy Allison wrote:
> I agree that (7) is orthoganal to merging the ldap
> client libraries, but not quite. The more code that
> gets added to winbindd using the tldap structures and
> client definitions, the harder the move to common
> marshalling will become.

Exactly.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




