Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B9838272E
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 10:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Be3SoobnVo+874Dpjb9qZRKKPXm47Rj4XLo63KJH91Y=; b=XkVowuQAdhkyoUyOlNiW8V9yck
	TVJqpVXmMLQt9VQRCJh+j6R/Qiys5rNDTtRnbeoaEzZPNCb2DAFibQjdy6C38Z/kCUQoxFOvM0dii
	qs/MEC/J+h/F3u54Z7HvAhuqNpkqBmQDvKlkBFareXUzkpi1Wi2aiNGsJNiyJ0QNkQdlbAmU53Cl7
	gVrZbz49CdSg1PBwfsS4PsNNCUD4hkSG4L105GOE2f2JRpg7wYaDvZwHI81qCg2QnuGF83gCl94N7
	L2vKq79WhYZV1AbW6LRAcYiVzh8f19wU6Js00roGmk5TjhM/yZSao7QWS75wYdEBHHFEn4jVnzGuF
	OhISp/eA==;
Received: from ip6-localhost ([::1]:37326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1liYlh-000gmy-1y; Mon, 17 May 2021 08:38:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53032) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liYlW-000get-H4
 for samba-technical@lists.samba.org; Mon, 17 May 2021 08:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Be3SoobnVo+874Dpjb9qZRKKPXm47Rj4XLo63KJH91Y=; b=JJkmeSt3DdUDODigo+7w2EFFMs
 4T+Z6RC2w+RG5WjbIEhglZSV9i/SvZ+sdOifwFbd9z2bVFehRv99Fl4T8/JI80TBFfOwThqnznTXA
 9aRrW2sA44yaSWOf1VFaETM2YL992sDM1+oV+1AilRX1t1ufqVwFxFl+cH/o7/UJCt6cX55109mH5
 O2fN/vpOQh5QOaYpUVNNsmMq/VUdc2eaD+lplpUE8ZyHzbo/otx2gApctcgW4IiW1DBw8RqruLlQS
 ZRxkNSw+PvH1N0+GmO+s7IvaK9JMX+vZuu3iMASlSpgVTtVsEJR+HhonHkKBkszM4KXzDoW3wYHlT
 f8JydEnllBJxy2nXKC9e2uJOMjiWYUDB6go39VyDsLbsBqzwpDnBt5Qu6uschQGIlkonBbBvF0xkf
 X5Al/1AV8MKe/6RgtfOulj8I5Af0ghMWfcC5epq+6ZDwiyRqjUlF9U46vmUPiDB2tkmSJxHq011t4
 yPdew7PzH9iz5NiD8G4sp7er;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liYlV-0000YW-LU; Mon, 17 May 2021 08:38:17 +0000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Offline logon flapping in autobuild?
Date: Mon, 17 May 2021 10:38:15 +0200
Message-ID: <1949061.8nGXxLBRy0@magrathea>
In-Reply-To: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 13 May 2021 10:17:48 CEST Andrew Bartlett wrote:
> My most recent autobuild, with (I hope) unrelated changes, fails with:
> 
> [141(1068)/143 at 6m5s]
> samba.blackbox.offline_logon(ad_member_offline_logon)
> ERROR: Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)]
> REASON: unable to set up environment ad_member_offline_logon - exiting
> could not obtain winbind interface details: WBC_ERR_WINBIND_NOT_AVAILABLE
> could not obtain winbind domain name!
> failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE

It doesn't really have to do something with the offline logon. winbindd did 
not start and was failing, the error why it didn't start would be the 
interesing one. However for this we need the logs


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



