Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB891ED8F8
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jun 2020 01:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PBpW0SpWmGknRNkADY1P4yIZepL+RaoBInsWQkiFDDs=; b=aYxmdmgo/Jf+HnueuA8Tt9xUqj
	uGTha0Hw/7MN5H3tWUCiHiPE28Ee1A+VhOzmtzFeGgqc/rWO5E65NJPw6aThCCHOqUxeteM36GDzI
	HuZY0YqPm+ZhwEsSAZZQCQHV2aQihf+drM4YJuPKuBIYlxbF1Ed5+0/38aTWnive+j1T42CKHaCIZ
	QUtUuEclLsMuCdKhRCwX4jGqCyQ7hfPHISQNXyEGYMCknSQHq9sz2fqQqQ2uOzP6frb1CBJEyknh9
	Uxp3rS1jvCNnWKTnq+qA9DIpRFv5O4Y5Dy8zh31IJEjLxPnm2H6EyZW74rSqugefq6AjtUvGLgNEg
	ocW3sjog==;
Received: from localhost ([::1]:58092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgcYs-008jgF-98; Wed, 03 Jun 2020 23:12:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgcYn-008jg7-9y
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 23:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=PBpW0SpWmGknRNkADY1P4yIZepL+RaoBInsWQkiFDDs=; b=CX+MWHw+8OiY7gDJwVLsi7Rcld
 cBtbryHe601F1bhxQ36Bs0DfJACzWSf8CyPTCaSFFFCcOZcKTmvgW+fz+VWVf4KBvZNsELRnlWaWA
 ds4k6KKrR7qI/TJQWAnJ5uKc+foiRCTSAXNdmAWuSpXnRNsXzQY6wElx5vY29ZisDc6aPY67e7byi
 kIg+Gzql0b3shJFvTBYaWvVEUt38bzWVkUnwIV2yic32IrVYSBtZ2AO3seGBSewJ9AKj4l5QzlltL
 9AqWwdv4e113FAwPPm6qta3JmZzadpbhhf6bTzZAY/2LuEBRTgo8QkcgF9ltumnceY+pybifdKXTk
 AHGFwpZDCIsH6Bo+5qNInfIBwVCTFFlzBkhR1U3kSpxPjf96wFb7Q+hjjO7L7w3p41j2yCvXZFhhX
 VUdT+FdZNbp3uD/auMOCzJqulrlTrPK0BAobLq1T89BT30/vKLH4ciVAulXQ4Anov5bQsJ4TqYedi
 sxZeyRghnRhCr3azVr6BckHY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgcYm-0001da-6q; Wed, 03 Jun 2020 23:12:37 +0000
Message-ID: <c967269c2c59f7a062b392234584d20a2b6f6c4a.camel@samba.org>
Subject: Re: Release tar ball scripts
To: David Mulder <dmulder@suse.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Thu, 04 Jun 2020 11:12:32 +1200
In-Reply-To: <7e3f689e-1170-8824-340b-b6af3a7ddcbb@suse.com>
References: <7e3f689e-1170-8824-340b-b6af3a7ddcbb@suse.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-03 at 16:50 -0600, David Mulder via samba-technical
wrote:
> Where do the scripts live that generate the release tar balls for
> talloc/tdb/ldb/tevent? The ones on samba ftp?
> I'm trying to generate the latest ldb tar ball off of master (master
> requires ldb 2.2.0), to simplify some build testing, and it seems
> like
> I've seen these scripts somewhere before.
> I could figure this out on my own, but it would be easier if someone
> could point me in the right direction.

make dist in lib/ldb should do it.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




