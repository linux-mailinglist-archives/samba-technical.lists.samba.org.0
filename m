Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA587DBE7D
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 18:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=U8Gqr+NdLbq37FD3ymfkk0Ipcd838J8RCYQ1IWtvVF4=; b=5KdyE8/g2RGyqrTJMIN6sXHA/A
	cebe6zuzLWLwQIQBp/E18PhMsjpZ9MRBidwSjnUDNawAHU/eREYrZvBh1hbzBmZe3tuFgDsfRAIZD
	DSeIEaGoe9K+GZ4uQfKWT01ZQ3KmIO30QMF1sPBoeZJgaf0BH2855qqg/WLNdEDobDjyiGdqlcWMc
	vYpYUbOnL8Y68cUM+wxscp8/eWjBL9wSbu7nsoGuVhXEmHBqQEJS430ZsAluTq5yfhoR03EDH3AfF
	yZkGDkWlxntwhrBohtFTT2nqmqDuF1r8xOyHpNHHLXpS05GDSYucns4t1dW7sdQ1mnZtCI1L1tJBN
	ANgEFnzQ==;
Received: from ip6-localhost ([::1]:60340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxVgw-003aE2-HI; Mon, 30 Oct 2023 17:04:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxVgs-003aDt-Ht
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 17:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=U8Gqr+NdLbq37FD3ymfkk0Ipcd838J8RCYQ1IWtvVF4=; b=NAa96uFqiI1HK+SUJk4pCvr8gy
 spMRmncfPvWSy3i4oH624wjQEmXL8AhvVQ6fv+eaxW0IZjMP06xHDg/YtnzSMTXCWu0qXch4rFZ96
 K25MnOC/VaTK2i4LZ3UBWlLQENf19XHhFeOUbi7Cs+czenTBUFwLmknrApAq/RftUwOW0g0fpR3/4
 5jghvu/k9+z4fp2KlQuQokVj42Kph8dsCtcEG4Lw/K0XBgUwsBU25jU6koMf9ubHYpFuw+vmO6ayT
 s9wUvTfe0UpYhxbYETIInfyJPYaHLXhAh/cfpM65+SiEkWxPjPL1y/BuG7KRWus2StFhBDMG4U7VO
 3tJmmPHKvg2GRaNFKLAX3UIG6cBETPXkoJywJf7o/Jfw5ZNM6qPZ5zw3BUky6V97H94bk01Mtog0M
 aDyUfmL23rXKDlsjrFfhJhsjTqKEdTXBw05hCyr5yz2k0cWlet7ZZkUJoVkqq+qFi2FurCRxz6nRB
 VKFfbjn+lG2XbDpOKq0mHcNS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxVgp-003M8t-1e; Mon, 30 Oct 2023 17:04:35 +0000
Date: Mon, 30 Oct 2023 10:04:32 -0700
To: Ralph Boehme <slow@samba.org>, Volker Lendecke <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>, Tom Talpey <tom@talpey.com>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Message-ID: <ZT/iIEEeGezgZeqM@jeremy-HP-Z840-Workstation>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 30, 2023 at 09:28:17AM -0700, Jeremy Allison via samba-technical wrote:
>On Mon, Oct 30, 2023 at 04:03:29PM +0100, Ralph Boehme wrote:
>>Hi!
>>
>>I just stumpled over our old SMB1 UNIX extensions code dealing with 
>>file creation in POSIX context. There we have in 
>>open_file_ntcreate():
>>
>>       if (new_dos_attributes & FILE_FLAG_POSIX_SEMANTICS) {
>>               posix_open = True;
>>               unx_mode = (mode_t)(new_dos_attributes & 
>>~FILE_FLAG_POSIX_SEMANTICS);
>>               new_dos_attributes = 0;
>>       } else {
>>               ...
>>               new_dos_attributes |= FILE_ATTRIBUTE_ARCHIVE;
>>               ...
>>       }
>>
>>Why don't we set ARCHIVE for files created in POSIX context? Makes 
>>no sense to me.
>
>I *think* it was back from when most servers were running
>without EA's, so archive was mapped to a POSIX perms bit.


I think we could change it to add in the archive bit so
long as we have EA support. Thoughts ?

