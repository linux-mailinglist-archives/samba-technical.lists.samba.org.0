Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D618295C
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 07:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3Lgln8pXdSne0Hl7uvaEb3pQak7ThQHu/0t2gD0bVzI=; b=li9Kn46YQ3vrktSQQPhyx9fcju
	2MCUIdsy3hMGvgE95crDKUVrt7wYd3QT0Zj3enz7XJyoJrSsuC+dEi5oMsb2G8odWacKdHK13pRV4
	TI2Fm1Gq03dm5UBr78I04F94fSBLxdgC6QSudRT2+aIUTL2NHpEgyWdXWDmLUbe0hBqnxw5mwYCYJ
	4RULyuk1+Cqg0xuS1bAAF0vG9/5QErdQTIZ4qJ4/o8SJFfk80P5tsubfGu6H4XwVYBwhGz64bAfKo
	i5xN2xuchKOSwgtU6J1nfGUtf5WEAa1u3o2zNPkXdHK0hFrNC7Ge0tfC2WyI1KUBcXjj1IyDN+UuK
	qrdT0qGw==;
Received: from ip6-localhost ([::1]:36534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCHki-00FtZt-De; Thu, 12 Mar 2020 06:55:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25062) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCHkP-00FtZm-MZ
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 06:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3Lgln8pXdSne0Hl7uvaEb3pQak7ThQHu/0t2gD0bVzI=; b=h0Ps2WgBeA//5RwVtQcJix0wC+
 xjiGiiCTAuR4anICzfB6JQgDBWkzJh7JYoBB4u20AuVd8JhzbYdZZMNVSwpIJH1/XMCmybnav4JeT
 UBdZwpsnzFEEuD6jOdQZoUuDlxajHV5EFUyDsLJsbt1RArb0FZ/IAbb7o7D/qcMdMO5Zd9dQ027Sr
 Idruzai51YyfjZGMvNG5L/HJXK2LNgUNzucJmpzhpQzpIDkjFV6yr8LMYmrmiESzOStl2QEYoFXo6
 mP94LllJOZKrlKLFFzcsRxo0aWiOvOfIqsJDfglUB/cnzmHibBmrntQepQ1qQfcBRTen5MdatLG0V
 g/bOBUPLrWoUTcoQbP8RON4VZgsnEuvrLW3ZEnLr+UxQZOtke8nIG8r6lnaj8Jv4wxoQTUmj1rPpB
 geH2ile47MaHa2gvUGSbC7Jx+HAqRButtK7OzX7/xlEbcnh0uCUSwWO5S4DHMs765uB/Qcy1An/Ks
 DeSKBqejBRDYGh3/m9q9zvnW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCHkK-0003DZ-Rp; Thu, 12 Mar 2020 06:55:09 +0000
Date: Thu, 12 Mar 2020 08:55:06 +0200
To: Andreas Schneider <asn@samba.org>
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
Message-ID: <20200312065506.GN2735275@onega.vda.li>
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
 <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
 <38643263.Z8vMgeSRLk@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38643263.Z8vMgeSRLk@magrathea>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 William Brown <wbrown@suse.de>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 12 maalis 2020, Andreas Schneider wrote:
> On Thursday, 12 March 2020 04:40:47 CET William Brown wrote:
> > > On 12 Mar 2020, at 13:17, Andrew Bartlett via samba-technical
> > > <samba-technical@lists.samba.org> wrote:
> > > 
> > > G'Day Andreas and the list,
> > > 
> > > It bothers me a little that for every Samba change we make we spin up
> > > 37 builds on 37 VMs.  It feels a little excessive, and while CI is
> > > awesome when it saves us all time we should also use the earth and
> > > Samba Team's resources carefully.  (Even jobs aimed at the 'free' CI
> > > can be run on our servers if GitLab.com's servers are busy, and the
> > > planet pays either way).
> > > 
> > > Therefore I wondered if we should also stop running CI on Fedora 29 and
> > > OpenSUSE 15.0, both of which are now it is EOL upstream?
> > > 
> > > Both went EOL in Nov/Dec 2019.
> > > 
> > > In the future I think we should set policy to only CI on (some, subject
> > > to other constraints) supported distributions.
> > > 
> > > What do folks think?
> > 
> > This sounds like a 100% reasonable policy to only run CI on active/supported
> > distributions. :)
> 
> Yes, we can drop them.
> 
> I think we can also just run the latest Fedora version (two versions when a 
> new release comes out for a few days). We have CentOS which provide old enough 
> distros to show we still run on that stuff.
> 
> 
> Alexander, what do you think?

F31 and F32 would be perfect. They differ enough (different gcc,
different Python versions) to catch bugs.

-- 
/ Alexander Bokovoy

