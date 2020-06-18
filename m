Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A151FFDDF
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 00:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=EZgLmQP4w5Ik94k8LpD2Y/FUE1dM5eFHai1fE3PQxZE=; b=TDNIVk9i0R+mPJdSF6wY9jN41e
	/pJ8xFC585W5Ivm7Xe7tVS220JPVnzvaI4Au6WdrsMft86RgUI/nXBX8s1fRLSsbiAbYzkEBNaIvX
	S7g4WRWEUZ94Sj5lsZjzqFFvwS7/5ekouOa5Mah3ViPltPsb5Aeiolr5LpZD+YZOXH94MV+RcgRYC
	GRvtanNmOYMt+7uf9haMxuNBp27iKh8JyoWFnA0Div7YMHnOu+97Jg/f51kcWWEEj7Ng9DOIXAwEJ
	RLYxccvIBFgU9KCKbFkvCI0oXo1VmGWzGjoi6CijvzgDjeqnEb+PssDqIquYYAs52JMR9lC51kEjB
	L9nfNYQQ==;
Received: from localhost ([::1]:40282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jm2t0-001JAZ-1T; Thu, 18 Jun 2020 22:19:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm2ss-001JAS-VT
 for samba-technical@lists.samba.org; Thu, 18 Jun 2020 22:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=EZgLmQP4w5Ik94k8LpD2Y/FUE1dM5eFHai1fE3PQxZE=; b=ZMcBeb64pruVjk4BYo+49fCler
 ZdE+81c4rG2Xw9k96avFLiYaB5MOoaIv4scB+8mOApLmsnECiNGn3XJ8FH8tP0NB9d4tOig7Sbcvv
 D1Z+LgL/+QoXnxy8+WhNkaIb+IG/J7rLdY6CgEdvh94y8lZJOweRLUUKaSOkVLMo+qy3ynRNfqib0
 oRELDaeCaE+0w4AXYKGFyqFK3aNct19uZ4w8Vu9TynaMA402rK27G7TVWs/OuVBzLkfBTWs+xiZQR
 hN5iyD3ciEsIHTko8y+zSCnNkdXldXfYYYvi0TAd5FzLEC9CbnY74VQLxR0HVkhcxaXN7Sb+uesUi
 EhcNV8oaCycDOGnqecNBIFn/nUP7U8MFE9QoplVnt64b6s2EEDVkGttNUbN087fCV4DZ8HYYhi/J+
 54EOD/gFcGkZgQqFv/yUI+9j3XFuIGEwxKDrvugSrNhlL54Ls/v8z27v0zE7JNatAIdPUlgyrrGHn
 ZB6ULCwrsNIjI6pBPF40BS3b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm2sr-0005Ee-4j; Thu, 18 Jun 2020 22:19:46 +0000
Message-ID: <9f00da33e7c31f8f6304af90280bdef8f917c7c3.camel@samba.org>
Subject: Re: New Contribute page on the wiki
To: Jeremy Allison <jra@samba.org>, David Mulder <dmulder@suse.com>
Date: Fri, 19 Jun 2020 10:19:41 +1200
In-Reply-To: <20200526172611.GG18267@jeremy-acer>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
 <20200526172611.GG18267@jeremy-acer>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-05-26 at 10:26 -0700, Jeremy Allison via samba-technical
wrote:
> On Tue, May 26, 2020 at 08:13:09AM -0600, David Mulder via samba-
> technical wrote:
> > We've started hashing out a new Contribute page for the samba wiki.
> > You can view it here: 
> > https://wiki.samba.org/index.php/Contribute_New
> > 
> > The old Contribute page doesn't match the current process, so it
> > seemed
> > writing a new page from scratch was in order.
> > 
> > I want to start a discussion here so we can hopefully improve the
> > page.
> > Please comment and also contribute to the Contribute page!
> 
> David, this is really good ! Thanks a lot for this one.

David and I have also been working on 
https://wiki.samba.org/index.php/Creating_a_Samba_patch_series

We hope this describes many of the to-date unwritten rules of Samba
development.  We would encourage more of these to be written down.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




