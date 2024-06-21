Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C479091172E
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2024 02:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0QQinY99Mb831ruYevOpR+gcyDoI97SKYhxOZe2HG1U=; b=sTal02owJ9yJV5odADuX9X9ijS
	njOjfLG8dKzqUwOx6j5EN7eq930vmh24S4sLDsDRmksoyFIy2q3o6wmVoO7hetIlBz2UgZLZ9ALvV
	7gjrxRcBI0JJZp2omLsEuHVvZk+sjYVDxEFpYJIcsHH6de6OvZp9AS/qq9YhZcfBUWlhrXprJ2G8n
	gqU38YeUkFwz9S5xDnvCHo8B57hJYa47Zmb2FMgE3VHUBnaAcvGsUaPjALTybUu2MvS9y4aahhggD
	fcGGl9na/MjNGvtYaYeEhA4V8u+TCpLw8hRLyMEmG96xoDtXYEvZqv7ceVd5SV38F8vFORQ/us+RO
	LU4KCPfQ==;
Received: from ip6-localhost ([::1]:63404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKRuY-00Eloq-Rq; Fri, 21 Jun 2024 00:13:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61232) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKRuT-00Eloj-JI
 for samba-technical@lists.samba.org; Fri, 21 Jun 2024 00:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=UScLQhkjmQgkbGxJcXb+IyTD2NGkzSfk+OWf34AzxWY=; b=zstGUksrNBhS6/g2i+b1bckqkE
 JeE/SNb3Vs+H2l4GDbodhiFihyIuaYYejT2iwRM+0ZLdVQWqKIpSClcLB/gT+1NyQZHJDFE5/zCI+
 glb800DHJrGyL1NAwtWOxrTqcLxea7I0+XTnt7/Y0hfbzafsrkS172jGk2ArBR+zcbpFhCGDymFhn
 1PR9MBFBoRsa8vFUH9Io1/3jht1yji7ixUkwUsVFUQN25E6qQvqk+I4Rn3+73MfYgJvKlbQ2HjIcn
 7Rh5mry5yqU7n0t0GwXytPN8bBGXaarLE/8vcAraMUXOCX9RkM0MnPkSSzA9rTls2J13snHA4iZMc
 YwDCODYt7UMqL+iLu7uHgIRMD6x60j35KjkxdEEDHXkIHAGbKQjKXYYjp0LgkPpg3v0me+N9TE9YL
 5FSA5kUC2hn78jbYEQmtQohlIh/K4q8z6aUD/Zn+gBElS6JOu7V0IylguraIt9gsSj/B1PXTm2AGd
 53rvw0jYhSdVMFcfJTt9pWZt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKRuQ-0008nn-2A; Fri, 21 Jun 2024 00:13:44 +0000
Message-ID: <1c2b9dfa483ba0a0fda0178f21da21749183c3ab.camel@samba.org>
Subject: Re: vendor version/revision string
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, Michael Tokarev
 <mjt@tls.msk.ru>, samba-technical <samba-technical@lists.samba.org>
Date: Fri, 21 Jun 2024 12:13:37 +1200
In-Reply-To: <c191d350-1dc1-42b8-a341-26281707e908@catalyst.net.nz>
References: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
 <050f14547c398b5d73faf917540f02dc0dee7f74.camel@samba.org>
 <c191d350-1dc1-42b8-a341-26281707e908@catalyst.net.nz>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Fri, 2024-06-21 at 11:09 +1200, Douglas Bagnall via samba-technical
wrote:
> On 21/06/24 10:52, Andrew Bartlett via samba-technical wrote:
> > .TH "NET" "8" "05/06/2024" "Samba 4\&.21\&.0pre1\-DEVELOPE"
> > "SystemAdministration tools"
> > Is what is emitted.  So some truncation the docbook-xml layers that
> > Idare not even look into.
> 
> https://docbook.sourceforge.net/release/xsl/current/doc/manpages/man.th.extra2.max.length.html
> perhaps.

diff --git a/docs-xml/xslt/man.xsl b/docs-xml/xslt/man.xslindex
e252b56d5e5..e6df84af450 100644--- a/docs-xml/xslt/man.xsl+++ b/docs-
xml/xslt/man.xsl@@ -10,6 +10,7 @@ <xsl:param
name="chunk.first.sections" select="1"/> <xsl:param
name="use.id.as.filename" select="1"/> <xsl:param
name="man.endnotes.are.numbered" select="0"/>+<xsl:param
name="man.th.extra2.max.length">300</xsl:param>  <!--      Our ulink
stylesheet omits @url part if content was specified

Fixed it.
Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
