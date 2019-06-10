Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D9B3B7E4
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jun 2019 16:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ecaFau5kuUWRgp8qE+5WAHNyYAn0+EsWdtlEzfXizuI=; b=ulzwHhMP4El8g3+gh0/kLgR8tx
	4lSesuPg7iMWSl7qib0xPQitSwFG0X7oOi0umqFBnRrMIqlH9aDMPUgmJPODM0qJcuFsRw74rzZM8
	AKXxzJklI8CkAPHioqoX8FXfs9s+rdVGGOlisrP0rXm3kSUSZdETMtWddExY5SM3hFqkp2BnxlzgD
	S/icg1EgS84wzRk2Gry8BypF2WJdNQ1ZZ2kRt8x2iIMU3bKo3qPNes8F34Gc8ROy/3zej6kVfSmrO
	wK3U07TzaFtMsXnnYF9XTVXtVEcZWjFm5GffgEq6kcjNKc1cWw6T7UECS/FHorPLda6Th+LKQiVhC
	1ZzEg+tw==;
Received: from localhost ([::1]:22794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1haLjH-000kNn-TB; Mon, 10 Jun 2019 14:56:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48846) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haLj8-000kNg-Gz
 for samba-technical@lists.samba.org; Mon, 10 Jun 2019 14:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=ecaFau5kuUWRgp8qE+5WAHNyYAn0+EsWdtlEzfXizuI=; b=LOqqrfPoXHOoRC8hlZCpgQu2B9
 c1mmzqjf1VMFUfuu9RIOP4HfhmpFcvnj86XNZtuhPmjZ9eUoVcF5VYVZdpaZE9lqYg+ueS7R2SR8h
 DIU+9xyIyR9rKrZhYOntJx155Qn+V24C3Yx6qUxPdO74mkEnVphuMKfBIckc3IfZKffs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haLj8-0006rk-2c; Mon, 10 Jun 2019 14:56:50 +0000
To: samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
Date: Mon, 10 Jun 2019 16:56:19 +0200
Message-ID: <48763148.viiOTLWQpP@krikkit>
In-Reply-To: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 7 June 2019 22:23:30 CEST Steve French via samba-technical wrote:
> I am seeing more than double the performance of copy to Samba on
> encrypted mount with this two patch set, and 80%+ faster on copy from
> Samba server (when running Ralph's GCM capable experimental branch of
> Samba)

I'm sorry but I have to disappoint you, my name is Andreas and not Ralph ;-)



