Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B030113D093
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 00:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CTXm6Kf6ycixBKHuQEVhk4Skphfm7GJCXlzRp0DrBss=; b=D2bM+DIeuGNe39MRDqpRbT2rMz
	Xg0YlC0/dnoBw5jchg4QKAJfngDX9XrKV+dwp0m9Pdltif93QM7QVFAYnstAxeCMocuxxfvd1RkxY
	powm5rCaVzwc8AMhTAPYRgYVOG6oVy4IQiGNteTdybWW2E1BeQdFUjwysZ0OxCcmeeOANDOuR6Tko
	0xsmA+tmhDNl0MzqNPQ05sV406H1UCP9E8V/jg/zJJOfVdgG01RTXXjFvAFC1m1GgOyuG42lPjvrQ
	QyQMI7LV1h8nRSIn7fFOhjqCMj4ubcLDiVN+m4/9IBBhgzX3ErDWgYaRrV4MgZHZ8Wq2+1nTYU0g7
	r6aAsBfA==;
Received: from localhost ([::1]:19260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irrqH-003afG-MR; Wed, 15 Jan 2020 23:12:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irrqE-003aet-0f
 for samba-technical@lists.samba.org; Wed, 15 Jan 2020 23:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=CTXm6Kf6ycixBKHuQEVhk4Skphfm7GJCXlzRp0DrBss=; b=g2g3u/F9AesvMY9Hx/RuK3juLW
 WdOUPI+gY2DYRaHNTfD2G6xWzXXXtgRklUiw1tnBqDsgoOCgHlarwN0rMnDoee2hcPfnm4hlhfxQi
 JDEWkuzGcpg95SV9PSxNc20LdtE0wA4sDtssPHkJcTLgguL7jzckCagjYTTmFLPO2mhjWB00oLXW7
 8VHi6shl73wTTPuT198VKmJc8JOdDmV3mhGSxzXVYOiUP0PVfGmihXfwahiok9jS/QnTn8FTnDJZY
 A+wepcRLCcqPW+l8UogfwIWKLY1dQKeDeUxwLz8KRoSFp8pIlfL3PUhiavGkXNLrfeelptjz2NbTN
 xpQPxajsKKgwuxsdafg9qBSXo7+V4LMAmurjTskA0CFD2EZPb/rd7JtQ+QkULj6xz+FoChATfoOa+
 Ylf5mfSxPEDbJiRkF1on+5gm25eq5Ymh8F0Pw2paoXk34depICDRBLlUkZcgi5T8gA9nqPjEWmdr0
 QK4t55XBely+N0BAIldp2c9Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irrqC-0002WV-LT; Wed, 15 Jan 2020 23:12:49 +0000
Date: Wed, 15 Jan 2020 15:12:45 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Re: Re: Port knock of 445 prevents smbd from starting
Message-ID: <20200115231245.GD38061@jra4>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
 <20200114215623.GE217935@jra4>
 <cb951458c2004bf7a39ab19f0f49916b@ibm.com>
 <20200114224050.GA28030@jra4>
 <C67A52B7-5F24-49E1-B4E6-F38A25D8DF2D@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C67A52B7-5F24-49E1-B4E6-F38A25D8DF2D@ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 15, 2020 at 11:04:25PM +0000, Christopher O Cowan - Christopher.O.Cowan@ibm.com wrote:
> So, the inbound packet is a connection attempt by the LB, no data is being set.  It looks like it is only verifying that it completes the 3 way handshake.    From my tcpdump traces, I see the SYN -> FIN and then it ends.
> 
> It reports a status of NT_STATUS_END_OF_FILE.    The smb_len is 5456, as it returns from read_smb_length_return_keepalive.  Seems to me this should be 0. 

read_fd_with_timeout() should not return with zero bytes
when called from read_smb_length_return_keepalive().

read_smb_length_return_keepalive() ->

	status = read_fd_with_timeout(fd, inbuf, 4, 4, timeout, NULL);

where:

NTSTATUS read_fd_with_timeout(int fd, char *buf,
                                  size_t mincnt, size_t maxcnt,
                                  unsigned int time_out,
                                  size_t *size_ret)

mincnt and maxcnt == 4, so it should never be
returning NT_STATUS_OK unless it read at least
mincnt bytes.

Can you instrument read_fd_with_timeout() to
find out what is going on here ?

