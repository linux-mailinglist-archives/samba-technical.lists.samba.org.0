Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 232D017AD6E
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 18:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uE6OkgMPZz6nZpgwCshWvEDzyGzmQZyQeTjB3tunBQY=; b=ofxFHcSZZ1HsgWDmAzmmbIEQHh
	WTDbF21y8kYts79uHYC9Xji6ZjfLx5IXWogVcbVQSJSHaD5i117s3PJDDZlXMnAi+rgc7Pr7cEoxl
	652x75bNYXJFPWc7itynVnsoogUQkVDoA5rU7CE5wqcsGRWIh4ODM908gUxEQP+/2aZ0NoMGouJUR
	t4mRFAvRZIb26zCpnpKc09iyluf0fei33nOzcLJaYIX4i5i6czWPsksecpc7jUdmWBW+zE6dQHGhO
	zlUyfPuWBPB6IgQg7R9S7dX1NHl0rCFG4odr01vA7mcty32tv81dxgJzVs4/zwBwivMcF7n481ZwO
	c+7E0+mA==;
Received: from localhost ([::1]:35098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9uT5-00FAHL-FB; Thu, 05 Mar 2020 17:39:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9uT0-00FAHE-PC
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 17:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uE6OkgMPZz6nZpgwCshWvEDzyGzmQZyQeTjB3tunBQY=; b=0twT/GUB745WnRqLQbo585N/uq
 G0S9nTH5GIYRtNfPv9+/Y1XeKlP/dUMNaoxa0KNEef29Yor9ytmOT3xnRafjNwP6hf6+qstX0xzTL
 ZeiEYgH7XLAaouaGWK1MXnxVtKHNAOfNMdBLDJlZn4wbGMPkHuIvcXK5x4nsQFhjxb59/73u2LWMP
 KiNWz623GhcRuNDsaU6n1/YdCHKQntWP+GdlIeqhM7V8xnZFLAH7gU726BKN+XR4gmYC+px+Bi2mV
 N1bHeDC6aHh6UaYoYhiV4N5y57IEDyneGOwuJNe4sEYq0pJJCvF605OH/2Tm1S+HrhBDUQTvnTtOv
 ws8ZSt4oblgvd39JvunsbLsmt/c0ol3T2qIG4x1A880Fr9NRHzLoOtgsRjIAqfwmNoeXt6h1yd4K/
 ln4DWGNOxU9xU+RlbAATvxtW2oZDACjn3sPneefMvoOLmWLTe4ndMqBf6nvxdT5E+2YtZaZ823NNF
 tzS/EigLAjZHbScHrW/GWg1q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9uSz-0005vV-9N; Thu, 05 Mar 2020 17:39:25 +0000
Message-ID: <8767977743a6cf16167e1e5f3d951664d3e1a524.camel@samba.org>
Subject: About 4.11/4.12 and SMB1 being disabled by default
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>, 
 samba-technical@lists.samba.org
Date: Fri, 06 Mar 2020 06:39:21 +1300
In-Reply-To: <DDE986AD-16BC-44FB-BD4A-CD17F9E8BA16@rosalinux.ru>
References: <20200303104715.GA11956@carrie2>
 <F5AB518A-4210-4A4F-B6E7-3FED4A78F7E6@rosalinux.ru>
 <bcca2904922f9c6f0a3594c39a336f0ab175c4e8.camel@samba.org>
 <DDE986AD-16BC-44FB-BD4A-CD17F9E8BA16@rosalinux.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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

On Thu, 2020-03-05 at 10:44 +0300, Mikhail Novosyolov via samba-
technical wrote:
> 
> 5 марта 2020 г. 9:34:36 GMT+03:00, Andrew Bartlett <abartlet@samba.org> пишет:
> > On Thu, 2020-03-05 at 08:13 +0300, Mikhail Novosyolov via samba-
> > technical wrote:
> > > Hello,
> > > 
> > > What is the status of SMBv1 in Samba 4.12?
> > 
> > Unchanged from Samba 4.11, that is off by default but fully supported.
> > 
> > We are still planning to remove SMB1 in a future version because not
> > only is is an old arcane protocol, it makes being a great SMB2 server
> > harder.
> 
> Thanks. I have looked into the changelog of samba 4.11.0 [1], but
> 'client min protocol = NT1' had to be explicitly set in 4.8+. Could
> you please clearify what exactly changed in 4.11 regarding smb1? Or
> maybe point to a commit that made the change.
> 
> [1] https://www.samba.org/samba/history/samba-4.11.0.html

In 4.11 we changed the default for "min protocol", which is the server-
side setting.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



