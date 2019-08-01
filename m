Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A503D7D6E0
	for <lists+samba-technical@lfdr.de>; Thu,  1 Aug 2019 10:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uqjHMdgaF7LuDAF9oZsHnLrTeE15VIi9x0+twPBjRhg=; b=15FCMVR41xkBOTpwWYRxweWgsB
	l+TUADqYrH8+7u0XhTpTLGdxKITvoWBIaHXQkEs8/mPXrONSNgMLdrQB7zv4el86yQMDDls0p3PHg
	j/mDqtj3Etk7RAwUSeZFIKJPx1JiWr3I0cjf8JD2OSEXN8Nl0Zi0I6Hxizge1dQbD+jcm0ubv8mfz
	2aC79pJJAgEbJIXe+1YW7x3KRc7EWm80uNc4goCKLOhyIDPCb5J2KxoCW172eC0CyNWyD2ZDkXa01
	DrKgEZ8rtbNsW/Eb4seTzu0sVtVodjoVTSDhny23Q/YKqttgAvPq7qg5qtk0T9nViQdKt+PNXSY1S
	+N6kj8rA==;
Received: from localhost ([::1]:52806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ht64G-003M5R-35; Thu, 01 Aug 2019 08:04:08 +0000
Received: from userp2130.oracle.com ([156.151.31.86]:49074) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ht64B-003M5K-Az
 for samba-technical@lists.samba.org; Thu, 01 Aug 2019 08:04:05 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x717wwaS173578;
 Thu, 1 Aug 2019 08:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=uqjHMdgaF7LuDAF9oZsHnLrTeE15VIi9x0+twPBjRhg=;
 b=hoOY+r66LbPdS7EdDSgz2aQO1m3ADA6xCt8ord1HLpK++3iX5/LwIjypy+f8KCoHL3RR
 m4lRyOaCOq1XGMGDvgs3S6MPO0JbuL3Vyyhrw30VXWsliZQ1sarPvD1KqR+2TeX9wPiw
 ZFcm/CJzNV/85TnFTm4KBpMzNkN3l8LiAeygwVQ2f6amFXc2fUrUrYNttqk2HEOzKYK9
 knPVV/wV+Jxe66J3bC7ebeYFX/TPbV6I+7tIx3tkagPzBFHvpg/W22AYqJpTzylLGp2V
 N2ajCzDN6rrN9dIH8Xh9JnGy4jcvp01v1v07DDpnScUayvZmHY6m01J3IqHsE1aWf0yy jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2u0e1u28de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Aug 2019 08:03:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x71831bA179061;
 Thu, 1 Aug 2019 08:03:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2u3mbtw5ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Aug 2019 08:03:56 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7183qwu000621;
 Thu, 1 Aug 2019 08:03:52 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 01 Aug 2019 01:03:51 -0700
Date: Thu, 1 Aug 2019 11:03:43 +0300
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-ID: <20190801080343.GA1935@kadam>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com> <20190731122841.GA1974@kadam>
 <87lfwerze8.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lfwerze8.fsf@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Colin King <colin.king@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 05:34:39PM +0200, Aurélien Aptel wrote:
> "Dan Carpenter" <dan.carpenter@oracle.com> writes:
> > You're just turning off GCC's static analysis (and introducing false
> > positives) when you do that.  We have seen bugs caused by this and never
> > seen any bugs prevented by this style.
> 
> You've never seen bugs prevented by initializing uninitialized
> variables? Code can change overtime and I don't think coverity is
> checked as often as it could be, meaning the var could end up being used
> while uninitialized in the future.

Of course, we wouldn't see bugs that were prevented so that wasn't
entirely fair.

There is a several year old bug in GCC where it sometimes initializes
these to zero and doesn't warn about the uninitialized variable so it
is actually possible to prevent a bug by initializing it to an error
code.

Smatch also warns about uninitialized variables.  I normally run Smatch
on linux-next every day but I have been out of office for the past
month and my config doesn't cover everything.

We haven't been able to enable this "redundant assignment" warning
because of all the false positives like this.  It mostly finds dead code
but it also does find some bugs where we forget to check the error code
or we use the wrong variable.

regards,
dan carpenter


