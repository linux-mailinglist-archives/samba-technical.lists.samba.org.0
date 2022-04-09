Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D09464FA5A6
	for <lists+samba-technical@lfdr.de>; Sat,  9 Apr 2022 09:53:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=msR7PLxNOW9AqWiQBxwkcS37+86a45haCdXzSXYViYY=; b=D2nidsDaTKdRPYQYPJrj92n4e/
	CayvMhilZTYOpF51ZM9hdHlHzyW63MzByE+18YSM71FiWMafnFsPgRkJ36P5gdZsQFlqnzGhkZ8NB
	JIFtIopvfuDyzij+F/H7XPblrPvbVQG/ISqIH4PcLE3hph2XKU6QkfOI/4FkbNeSLEYynD2Evk3CC
	mld0UGcPOduiqs1FfcIN16C/Z/3NP5/bEr0V3MkYFVfar0STfRTmv/bcIBgtjJ5besH6zybwWKMaO
	GgVZL752VcpXmkwPOo3MXFek1R2WmjhYBeB89HKaYLjjsBg8YTmTnqF+bGof6JCglSgCjwPSwGOq5
	vaQhuOWg==;
Received: from ip6-localhost ([::1]:37362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nd5tc-00BI0b-T8; Sat, 09 Apr 2022 07:52:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38270) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nd5tY-00BI0S-4J
 for samba-technical@lists.samba.org; Sat, 09 Apr 2022 07:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=msR7PLxNOW9AqWiQBxwkcS37+86a45haCdXzSXYViYY=; b=OYwGYUdV8wYjqy6LWluUVggtNB
 utxOHz/JTixhykALWFj7WvUmdnOIFZkQl/JumPtK2A8Q4CAVcteS/PuOfcBaTNkFjESN3O8otTsFE
 6vi6Bm6gGdaLMcnao5dOvU2iN0x7iG44AagbDlB0lDavQxo0s7ck4UjbEueTFImaapIrKQ1ie1Lij
 aNPA2Iz48ihrMAxjrQgjQtyC/Ll1zhF8Y476z+2k4urZTX+AN9uWT5Ifx0YognOrjPqA8eUsmKoe5
 XihFp91svfqxuxXfJZ32nIzJXCa5hzzMluxzO10gjxek+FtFFYPhYFmeTVMCe9opI/5JuCuYgjOSh
 dcFYu6orORqNtpnMEJlqVlWCdSRGA3L7edYFhvIcwuUIDhtaOZkt6VYo+EGMOXcPrUDo2VA4TYnUN
 cb/9l659RpT7Vu/BdHJJW9RbOFQ66LnhyvogFHBsrcGSQoAV7043XfWSAMP9U+7WdhMVzmB3gNSys
 zl2smFV5fUjV+cBexFO1MEM0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nd5tW-0068f0-AJ; Sat, 09 Apr 2022 07:52:30 +0000
Message-ID: <8368b49259376d59184da5aadc7c156226b950a4.camel@samba.org>
Subject: Re: waf and building python modules for multiple python versions
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 09 Apr 2022 19:52:26 +1200
In-Reply-To: <d210d52b-40f2-9420-9c12-9b5207fda5a1@msgid.tls.msk.ru>
References: <d210d52b-40f2-9420-9c12-9b5207fda5a1@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sat, 2022-04-09 at 10:14 +0300, Michael Tokarev via samba-technical
wrote:
> Here with waf, I don't see how it is possible. Well, I do
> see one possibility: to copy source into yet another separate
> subdir (as many subdirs as there are additional python
> versions for the build) and run configure & build & install
> in every of them in turn, specifying the right PYTHON= in
> the environment.  This *should* work.

That is the only plan I can think of.  But which python version would
Samba's python-using libs link to?  For as long as you ship smbtorture
and expect it to work you would have to do multiple versions of that as
well...

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


