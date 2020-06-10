Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7151F4C56
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 06:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=4Bh3gMzmXKf39yw68ep3QE0F3GbRyNYMULP76j965Ck=; b=Yn0x06blZVqWMiqO0ONtV7hG4T
	sqBlWN3zxKTG/dWg7CtWlBEmqOvc/ZFLXhU1dcZZSga01w/NPLhIyqZsydVt2svzmmN+uyHaptTqK
	BPTkkoGJYkAoTbzmD125+x2GYzLTO81BnDDmTs38YLBryt77tR7TQXGKJG6LuGAFQKEIjem6m6jIc
	vxvr4myP7u+52EfiXQQ8M6BtJU7AGJSClW7YqyzYMMmFYqETUZl6KYpc8Af7eWhXs9iOJC8TCdjCn
	T5cWC8IJ2isgqOriRuxwIAbUvCN/P0+XQbCsVaqqANqFphNUaKlscZ4lZJoAn5oBEgZg1DH8JcXhL
	eLeOF0Kg==;
Received: from localhost ([::1]:63390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jisNd-009h6O-4I; Wed, 10 Jun 2020 04:30:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jisNS-009h6G-5Q
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 04:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=4Bh3gMzmXKf39yw68ep3QE0F3GbRyNYMULP76j965Ck=; b=SaFeN3/fmtHkN/FLOMUJVr6awv
 SYehk1PXzJHoF+ufJk4tePWVwCO2YJE8w9fE1gnSzJy0W0eZ7vE+Uto3rPwfBcFAhbKjYnzMSzmg2
 /8OwDSo0PKLrCsovhpW3BxMqDedWaJjWVmC7Gy/tKkXODegIrJQ16g+ZipV4mUyf4sFtkgADkPfE7
 pRSUwT2yrEJyP/NKZyT0Iq3ul63/2ZjrbKfRlbWnzzCoZtfigfc66C0o90K7O0tTUf0kA6FXugu+/
 HWSgWGlYiX9w+PpcuQ9e3qVkErJREuvorKiR3nLMDdQqtGnybvrCpjBc2rEXnEiROjXt2mCn29rNJ
 5dSAesoKvQby6d8tkyykX8sNzKTS1AharJmTPmehTXeVZ/OfqGLg4iVNUq8pUvtbPpV4KqnRh4FyD
 rfvoph/kc1SqhfZCBUApTmeCOZZgM16CgQl25OneejdT938ffkSaIxMn5Xcg+M9eX/NjTSxPUyl92
 gV8PCmiOKSz9na5iwd8T0Pj2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jisNL-0002fx-Tg; Wed, 10 Jun 2020 04:30:08 +0000
Message-ID: <c83c6bd6bec6d8b59afe5bc987fe138b9e474fec.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>
Date: Wed, 10 Jun 2020 16:30:01 +1200
In-Reply-To: <a58c7575bf4856e9ad04dffe9b23e4b4ca1bfec2.camel@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <20200609184019.GB8351@jeremy-acer>
 <a58c7575bf4856e9ad04dffe9b23e4b4ca1bfec2.camel@samba.org>
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
Cc: Christof Schmitt <cs@samba.org>, swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-10 at 06:43 +1200, Andrew Bartlett via samba-technical
wrote:
> On Tue, 2020-06-09 at 11:40 -0700, Jeremy Allison wrote:
> > I agree that (7) is orthoganal to merging the ldap
> > client libraries, but not quite. The more code that
> > gets added to winbindd using the tldap structures and
> > client definitions, the harder the move to common
> > marshalling will become.
> 
> Exactly.

BTW, for those following along on the mailing list:  

While we normally prefer to dig into the more 'meta' issues here for
reasons I would prefer not to go into some of this discussion is
happening on the MR:

https://gitlab.com/samba-team/samba/-/merge_requests/1351

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




