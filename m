Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE781F384
	for <lists+samba-technical@lfdr.de>; Thu, 28 Dec 2023 02:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TLX6hTMzpj6xf4pDGGVZYyifeJuBmC4xGZsDnVakaGI=; b=J8BR2aQREYw+UfAOQd7L6xSge5
	X7yL5CRphcV0ZNwn6IDCl3NRqUDGAFEDTfPJpVBLg4RbPH+Mzzao2CH/YnjMPQkOsA1gVI1usklkS
	8IaRZqAH2w/9BcsxrpVoyoxpNDjGjH86EU/V6XeHLYyPt+CblSQepsDJVNcpjsqM0LlfL0EvVG3YQ
	xEH0/xabAWfCYyY6axXe11Gt0kk+Q/sqxh6NTkjM3u+XN9dqvM9fupmJuPVsR/SG3gFGF/wzUfrj5
	TlXmibILPi38jnZ6YYz89bedkznJG1j9W2lbuwfuZLUbMZZDsLLUEVB5tH2XWAsDQaJzIkvOCRX4H
	Re9tqieA==;
Received: from ip6-localhost ([::1]:51178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rIeoM-009Oq7-3O; Thu, 28 Dec 2023 01:03:46 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:45357) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rIeoG-009Opx-1Y
 for samba-technical@lists.samba.org; Thu, 28 Dec 2023 01:03:44 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EE3253200A4C
 for <samba-technical@lists.samba.org>; Wed, 27 Dec 2023 20:03:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute2.internal (MEProxy); Wed, 27 Dec 2023 20:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outurnate.com;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1703725412; x=1703811812; bh=TLX6hTMzpj
 6xf4pDGGVZYyifeJuBmC4xGZsDnVakaGI=; b=AJwaQwkmZHz5nSQfF8NzkxOUIM
 Tw0aMFJzSZ9Itw3mXocGM+Cti+1eH8zjta3csqRIXIP6UjDXhLYWSoWNI6dgvi0r
 09iNURqeLVAaxcKRJqLXjEBHPhnx0Nc8G/QE7IYLq1lgSf+7v8McC7rEC4K4PWrl
 xu9xRNRvpGcScyRRRmH0NcGfTBaewhegGkjdUa5FggyTeBkDcXI9ADZXMjifwAkN
 PUVaYM0lIoFyQSa9JKXY40Ns7feUjg6qZ7wuVXdKm2ddiyddbBo2asGvj7X3vqdd
 ZH0majABVJ+hHqRWu9ozqMV8p2Rzs3vAck5Dt5voErTLLrg3QbyHpB3bq4hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1703725412; x=1703811812; bh=TLX6hTMzpj6xf4pDGGVZYyifeJuB
 mC4xGZsDnVakaGI=; b=fBbTj1tUELgVHoteCYbWSFaKAGK/MFZL1UL26zCj1Zkl
 LbR6qU5WFL7vSDy3PkdA8NwSWfmTgipjvFp/Q33QCV+2iN79WsXZpLJKCOTjhCR5
 xekBhXDa7oP+qRc8gEJ2jSw5O0ZP7p+5lHNgCMMSVLoE+rAbCpRj2AL/Q9mNGSUE
 V08quiEmBFpF+lwPuf94zrfN2yIJ1ZG0Orz4BK0SeD/uVtJP5Sr43zg/DjrwySWj
 NfyyOnkYfeAgPJvMLk+Oe2b6VezTxh7FNzA0hg8Qs2CbzR0LQ7Fdog1qHMwoptAJ
 bcItsk59ftvOdjCSt4l9slBjiyzhcYiMyWRfp3hkQA==
X-ME-Sender: <xms:ZMmMZV22IGismAP6yVau4Mt3ZMPWBn_jOwjElNnhr1zbobukElNLJQ>
 <xme:ZMmMZcFPd8Ve8arYzxlObfwhS5UyepM50TbeSBYkj1LsMVj7c9EHYMvNpxGAvwxhp
 U4SwftHbHTEEVggls8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeftddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedflfhovgcuffhilhhlohhnfdcuoehjohhsvghphhesohhu
 thhurhhnrghtvgdrtghomheqnecuggftrfgrthhtvghrnheptddvfffgheelvdegtdejhe
 egleehhfehieffhfekiefhveevvddtkedujeevteeinecuffhomhgrihhnpehsuhhsvgdr
 tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hjohhsvghphhesohhuthhurhhnrghtvgdrtghomh
X-ME-Proxy: <xmx:ZMmMZV6zwCDy31FdGajwl2PWKRWh0KCr3PVyjGOq5AA8mrh_8bLjzA>
 <xmx:ZMmMZS0_vjajqdkbiBcKwORh5Bx79kLC3_mJUcjb59jqAoup_zyfYA>
 <xmx:ZMmMZYEYg7vivlA5-rzt_0yPguVQrJhkpJGMs0NoJw1YBjfO_4B1wA>
 <xmx:ZMmMZbxZk2SH4RSvrrSBJBog-Rhy220sPTHUhXZvqu7DqZMRf-fo8w>
Feedback-ID: ic7c14608:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2F235B6008F; Wed, 27 Dec 2023 20:03:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <cbff5f90-ddd0-4f9d-968c-b4a1344fd81a@app.fastmail.com>
In-Reply-To: <ddf5ae2e-0bb0-825e-5dde-67003aa419bc@samba.org>
References: <8fde5c31-92cb-4f66-a2d1-95f7ba4e7f1b@app.fastmail.com>
 <ddf5ae2e-0bb0-825e-5dde-67003aa419bc@samba.org>
Date: Wed, 27 Dec 2023 20:03:11 -0500
To: samba-technical@lists.samba.org
Subject: Re: Group Policy Ordering
Content-Type: text/plain
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
From: Joe Dillon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Dillon <joseph@outurnate.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 14, 2023, at 10:25 AM, David Mulder via samba-technical wrote:
> 
> On 12/13/23 5:20 PM, Joe Dillon via samba-technical wrote:
> > Suppose I link a policy called "Test Policy 1".  When samba-gpupdate runs, this policy will be in changed_gpo_list.  Suppose it sets the contents of /etc/test.txt to "testpolicy1".  The second time samba-gpupdate runs, it will not be in changed_gpo_list, and the CSE won't rewrite the file.  So far so good.  Now, I toggle "Test Policy 1" to enforced.  Rerunning samba-gpupdate does not process the policy.  Again, so far so good.  Suppose I link "Test Policy 2", unenforced.  Let's say the CSE for "Test Policy 2" would set the content of /etc/test.txt to "testpolicy2".  I would expect, since "Test Policy 1" has a higher priority, the contents of /etc/test.txt after a samba-gpupdate to be "testpolicy1".  When I run samba-gpupdate,  only "Test Policy 2" is processed, since it is the only one that changed.  "--force" obviously corrects the issue.
> >
> > Is this intended behaviour or a bug?
> This behavior changed significantly in recent versions of Samba. Which 
> version are you referring to? Also, policy enforcement is handled 
> per-extension, so you may see different behavior for each extension. 
> From your description, I would expect that there may be a bug in 
> processing the changed_gpo_list?
> > Second question: is it valid for GPOs based on .pol files to not write the registry entries to the local registry?  The above behaviour could be avoided if every gpupdate wrote all changes from all applicable GPOs to the registry and deferred processing to the end.
> This was in the works 4 years ago, but was never completed. The current 
> approach is for each extension to write their overlapping changes to a 
> tdb file, and apply the appropriate policy from there.
> 
> -- 
> David Mulder
> Labs Software Engineer, Samba
> SUSE
> 1221 S Valley Grove Way, Suite 500
> Pleasant Grove, UT 84062
> (P)+1 385.208.2989
> dmulder@suse.com
> http://www.suse.com
> 

I'm at 4.19.3.  I'm missing any commits between its release and today.  Would the changes be in those commits?  From my testing, which is using a policy extension that just prints the contents of the changed_gpo_list, it appears a GPO that changes enforcement status isn't being passed in.

From my read of the certificate client extension, it appears this tdb contains a custom json representation of the client extension's state.  So, in essence, an extension must parse the pol file, read the current tdb settings, merge them with changed/deleted GPO settings, persist them to the tdb, then apply the settings to the local system (in whatever way the current GPO extension does so)

Out of curiosity, why was the work to apply .pol files to samba's registry not completed?  Refactoring time/effort?  Or was there a blocker that couldn't be overcome?

Thanks,
Joe Dillon

