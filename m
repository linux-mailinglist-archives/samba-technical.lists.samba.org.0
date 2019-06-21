Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB834E158
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 09:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MsQ1I18saDDqFwhI/1b3007ZlfSqI4bjiTxJIFKCO1k=; b=IIhoG8rZjAIrXmHBRampA72sut
	lIQ01NxgR7jI20XKzZrswEL3j4fF7RO9ICb4jbSN1cGLmsXnEg5RnwO4iKn9GOLmLhdf8Nvgu9tFZ
	ie/zoNQ/m9cUDZMGGLg6j/31rR3u6+qlk8YyKu9ZlMGpp5v1opXYqna1u5yGVFC173hwOHRPJmhAK
	7cpFw4JN29AD9jhV66nGahBy8jTNDT/jIgVODV9wP8eaae1VVJBosE1CheYIGy6xKymcQ5CsNdY/M
	XmwgaPTZPP0Url5v3FSH/bE0KiPHo+DkAdOji8gISdZPcv8SKqQle+pKjLrq03R7lfXGxkdpIhORO
	r/iLyTbA==;
Received: from localhost ([::1]:60400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heEDV-000tTc-7x; Fri, 21 Jun 2019 07:44:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43198) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heEDR-000tTV-01
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 07:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=MsQ1I18saDDqFwhI/1b3007ZlfSqI4bjiTxJIFKCO1k=; b=J0reGTBaa/L0/gQRmhR5E+Db8C
 fEWp0ZGdhQMv3NIakFMQh9IogHoIA6GV/PQQAvwGJa+0Cu0UZp4SWmzJQj17ZleEioo0XhoP/+Hj0
 H1iVZWLvSq9i9fvip4TGbzA48ahpUVM4jJWoDQuDqDIvj3GusbGiFEyGcpi+CQtPCngU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heEDP-0008DA-W1; Fri, 21 Jun 2019 07:44:08 +0000
Message-ID: <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Date: Fri, 21 Jun 2019 19:44:04 +1200
In-Reply-To: <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
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

On Fri, 2019-06-21 at 08:13 +0100, Rowland penny via samba-technical
wrote:
> 
> Sorry, but I do not think it is 'wrong' to not want to use git-lab. 
> Perhaps we should 'prefer' people to use git-lab, but we definitely 
> shouldn't tell anybody off for sending a patch directly to samba-technical.
> 

G'Day Rowland,

Can you elaborate a bit more?  Can you explain a bit more why?  Can I
help you set up your account?

It would be really good to have you on-board.

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



