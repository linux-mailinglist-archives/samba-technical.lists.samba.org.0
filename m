Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E171913D0A3
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 00:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=gpdyYzpq59+PEbEKTz9xTn2CNtB7PgQnUXfnhGqLtl8=; b=fQqgujLarOcbqnhbYqlBMJjl7h
	fB5ILlqdafLg91VDrBlQjrivS3EXRcRClRx9RpUn5WB/TnLPI6top4cIkNc1qZcKoR7hLlDkVCSID
	lYttqbz4g5NHDZBJ6d5EWS2ZQGBT2gH5sE5UixN8LELuRlxDkCcvRx3zHyK9lHkOmiQbOivK+eQR5
	AABC3SCDJruR6eAMO4OXnSjpm94bd11AwofjRaDxHccml86PJrO4kAj3G9yDD8hm4Hr3teA38xCgY
	ejyTgmacvXQ9C/Ac+HgVL1ZWqBjGtkfWs+l0ffJ5gCejPM/1SBMA1IbPdUz+I6ARWxkp/+KzHYFNR
	ePEWD4fw==;
Received: from localhost ([::1]:20454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irs1k-003apc-JO; Wed, 15 Jan 2020 23:24:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irs1g-003apV-U0
 for samba-technical@lists.samba.org; Wed, 15 Jan 2020 23:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=gpdyYzpq59+PEbEKTz9xTn2CNtB7PgQnUXfnhGqLtl8=; b=SpoyL2VEFN9XJfJfB4nYK6tRfN
 JT+Kat6jUoEfSNXkHS7td2mqOl0j6x0My8TwmXE3zuUIrgZob3PCxE4ZrAZPt/mox7rbjz561Usxg
 sHLG0BbfcgVpqT+wV8XCzJOifwZC3KZ1MVeR7EKsxZKKbch/7pTYlRnQD6bWmLdHzLm12l6wcRo9r
 OLlp/kZrMZMyJrNfqGFgpxTG3N1Va6mwDTTptbDmOJJiaNXN4jdRKnAjVEq6hfVb1rr8TrUBMwWo3
 jUiqThlAbAm8zI+HQC7wq/HZqFwjfbnN4F5ot6vw7TzGKb8Ej+Vh3OBSxeYWVf+Ao+veBdfBOfLCP
 4qq6sLMnEdjOa28hssfYVd60R0JpS5HPN6Ptqscz1oc/klyFi++8x0aVbhxjdi8pKKgFNokmobzDd
 3lo6IOUBmAq+lIDVcaPAWSPWYEGGMMEUmEevGINdfQUvSRWFGkiMKIP1iQ6f1hkCt4o2W0m5JjZS8
 6QaBj74ZqBG9jh08RrTVxrSp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irs1g-0002d9-0q; Wed, 15 Jan 2020 23:24:40 +0000
Date: Wed, 15 Jan 2020 15:24:37 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>, 
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Re: Re: Port knock of 445 prevents smbd from starting
Message-ID: <20200115232437.GE38061@jra4>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
 <20200114215623.GE217935@jra4>
 <cb951458c2004bf7a39ab19f0f49916b@ibm.com>
 <20200114224050.GA28030@jra4>
 <C67A52B7-5F24-49E1-B4E6-F38A25D8DF2D@ibm.com>
 <20200115231245.GD38061@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115231245.GD38061@jra4>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 15, 2020 at 03:12:45PM -0800, Jeremy Allison via samba-technical wrote:
> On Wed, Jan 15, 2020 at 11:04:25PM +0000, Christopher O Cowan - Christopher.O.Cowan@ibm.com wrote:
> > So, the inbound packet is a connection attempt by the LB, no data is being set.  It looks like it is only verifying that it completes the 3 way handshake.    From my tcpdump traces, I see the SYN -> FIN and then it ends.
> > 
> > It reports a status of NT_STATUS_END_OF_FILE.    The smb_len is 5456, as it returns from read_smb_length_return_keepalive.  Seems to me this should be 0. 
> 
> read_fd_with_timeout() should not return with zero bytes
> when called from read_smb_length_return_keepalive().
> 
> read_smb_length_return_keepalive() ->
> 
> 	status = read_fd_with_timeout(fd, inbuf, 4, 4, timeout, NULL);
> 
> where:
> 
> NTSTATUS read_fd_with_timeout(int fd, char *buf,
>                                   size_t mincnt, size_t maxcnt,
>                                   unsigned int time_out,
>                                   size_t *size_ret)
> 
> mincnt and maxcnt == 4, so it should never be
> returning NT_STATUS_OK unless it read at least
> mincnt bytes.
> 
> Can you instrument read_fd_with_timeout() to
> find out what is going on here ?

Looking at the callers in source3/smbd/process.c
the timeout should be set to zero (blocking read).

In that case you should have:

NTSTATUS read_fd_with_timeout(int fd, char *buf,
                                  size_t mincnt, size_t maxcnt,
                                  unsigned int time_out,
                                  size_t *size_ret)
{
        int pollrtn;
        ssize_t readret;
        size_t nread = 0;

        /* just checking .... */
        if (maxcnt <= 0)
                return NT_STATUS_OK;

        /* Blocking read */
        if (time_out == 0) {
                if (mincnt == 0) {
                        mincnt = maxcnt;
                }

                while (nread < mincnt) {
                        readret = sys_read(fd, buf + nread, maxcnt - nread);

                        if (readret == 0) {
                                DEBUG(5,("read_fd_with_timeout: "
                                        "blocking read. EOF from client.\n"));
                                return NT_STATUS_END_OF_FILE;
                        }

                        if (readret == -1) {
                                return map_nt_error_from_unix(errno);
                        }
                        nread += readret;
                }
                goto done;
        }

so if sys_read() returned zero you should get read_fd_with_timeout()
returning NT_STATUS_END_OF_FILE.

read_smb_length_return_keepalive() should then return
that (NT_STATUS_END_OF_FILE) to the caller and never
try and do a read of any size. See below:

NTSTATUS read_smb_length_return_keepalive(int fd, char *inbuf,
                                          unsigned int timeout,
                                          size_t *len)
{
        int msg_type;
        NTSTATUS status;

        status = read_fd_with_timeout(fd, inbuf, 4, 4, timeout, NULL);

        if (!NT_STATUS_IS_OK(status)) {
                return status;
        }


