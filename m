Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 083447C91E
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 18:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QinEdhda0QF80hZU/Agg8fmLabZy/oSbGrNclrokDBw=; b=HphoR1sml8tf6sj8PnjrYG9Krf
	OO/mUPpvAfMaWgLoyt3glTHrH1TDO2xCteKA+Yrm4LJsYzmy6l/oXJcLqQk8a4BrtxxWj1IrTg6r6
	UAdgFAfOIJNMt3u9RlO7HlH2axoBO0bsUXrbhf69ve5dC7TOYYH/U0L3PGyhAxhwjvl8Y5Xh0X+at
	DPa0ilEJwxFkg1b0GIC8YNfZR6EpTmwsyMSxiPilso27Q9hBG96otMSK4M6DnOiFQcE5VyNLlpjGR
	q+2ZCEB98dHDQZpQcyrYsEYSKJHVse/HnjmwYb9SsKhn0nwYiKq1HIWi1lmMq6u6bjYOetDG7ny7+
	hjxESOkw==;
Received: from localhost ([::1]:21460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsrlZ-001ZAk-3L; Wed, 31 Jul 2019 16:47:53 +0000
Received: from userp2130.oracle.com ([156.151.31.86]:60836) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hsrlV-001ZAc-Ev
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 16:47:51 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6VCSffp017250;
 Wed, 31 Jul 2019 12:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=QinEdhda0QF80hZU/Agg8fmLabZy/oSbGrNclrokDBw=;
 b=UNwu0c4wPTcK+P1xidV4FT1LKRMkQxaz1cUkvPP0Ee+M+UU7Gz6OFj/z0zrdjsIBiIq4
 RR8DcnO5BwNTbkOvMba9ntx0ugykK37yx2s+Jx6DIgjqa48IZxcBXUaErA1PKGdhWr8G
 S8WWUkZgU4BlTabEqJIoeeOVWQGWLj0dAYvOkqC0FbbM0/OAXdFd2cjaI2oHoDA481B2
 +wEqkrBjyxFUHotQBrap0c7q5fg3j/fm9XhJXH2VLylTe5PSkrLLX5CH1ijL6LQ1clmv
 z5rKCBCAVw8gaAgmgUgsyHemIMKZ2yOeJ8PUZZ2MFFIg2K8J4ASWSTjwi0sYZWoA5hKV vg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2u0e1tw392-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 12:29:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6VCRT7A074339;
 Wed, 31 Jul 2019 12:29:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2u2exbjc4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 12:29:03 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6VCSwSp004011;
 Wed, 31 Jul 2019 12:28:58 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Jul 2019 12:28:57 +0000
Date: Wed, 31 Jul 2019 15:28:41 +0300
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-ID: <20190731122841.GA1974@kadam>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r266seg4.fsf@suse.com>
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

On Wed, Jul 31, 2019 at 12:09:31PM +0200, Aurélien Aptel wrote:
> Colin King <colin.king@canonical.com> writes:
> > Variable rc is being initialized with a value that is never read
> > and rc is being re-assigned a little later on. The assignment is
> > redundant and hence can be removed.
> 
> I think I would actually rather have rc set to an error by default than
> uninitialized. Just my personal opinion.

You're just turning off GCC's static analysis (and introducing false
positives) when you do that.  We have seen bugs caused by this and never
seen any bugs prevented by this style.

regards,
dan carpenter

