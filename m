Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB910D387
	for <lists+samba-technical@lfdr.de>; Fri, 29 Nov 2019 10:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UXBOTBnreYihu9DF9FL6NZDkqLeil9l/fqagemU3yzI=; b=1HygsuntyKCNZtvGf2QSVZgGgK
	9T8YFmA8re2MkZ3sds1T+HUAEKsZ44jWDyuOCWnFs50fMzISWnsGb3er93KvQEVC+VxtayJ+GrxK1
	2dEbaRTPgrpSW2cp2C+JrjgZ/4Mwsf9XEuef4N55itPDslBFRSOlbpRNcckdh/RyM6qI2kWtlOj2p
	ERwZCwo5lSSDwj8+aGbaH3msCbqHkKn6I+vl7txuYpDJfaRXiCPImFaVW6ECmd2U7Rmk3+gcVosDW
	NuyK1Xm2DiWbggyCzA6PWCwLbzLhl3rSOYScXK4C7Us6+b/I3i8aDgRVpSlnrPdCYAim0n9CLVv/q
	ZswOmrqQ==;
Received: from localhost ([::1]:34962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iad0t-003FxA-6q; Fri, 29 Nov 2019 09:56:35 +0000
Received: from [216.152.18.132] (port=34569 helo=smtp.bcstechnology.net) 
 by hr1.samba.org with esmtp (Exim) id 1iad0o-003Fx3-9N
 for samba-technical@lists.samba.org; Fri, 29 Nov 2019 09:56:32 +0000
Received: from [192.168.100.202] (unifi03.bcstechnology.net [192.168.100.202])
 by smtp.bcstechnology.net (8.14.3/SuSE Linux/BCS 2012) with ESMTP id
 xAT9an43029935
 for <samba-technical@lists.samba.org>; Fri, 29 Nov 2019 03:36:49 -0600
Message-ID: <5DE0E6B0.8070604@bcstechnology.net>
Date: Fri, 29 Nov 2019 03:36:48 -0600
Organization: BCS Technology Limited
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
 rv:1.9.2.28) Gecko/20120306 Thunderbird/3.1.20
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Subject: Errors while running configure
Content-Type: multipart/mixed; boundary="------------010900000108080202090902"
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
From: Bill Brier via samba-technical <samba-technical@lists.samba.org>
Reply-To: Bill Brier <steggy@bcstechnology.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------010900000108080202090902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello:

I am attempting to do a test build of Samba 4.8.5 running on SLES 12 
with Linux kernel 4.4.73. configure is reporting:

Could not find the python development headers

More specifically, a test compile within configure is trying to include 
Python.h, which file is not present on the system.  I went into the Yast 
software manager and loaded everything Python, without success.  I spent 
some time searching samba.org for references to this error, but didn't 
find anything helpful.  Please advise what configure is looking for.

Thank you!

--------------010900000108080202090902
Content-Type: text/x-vcard; charset=utf-8;
 name="steggy.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="steggy.vcf"

begin:vcard
fn:Bill Brier
n:Brier;Bill
org:BCS Technology Limited
adr;dom:;;805 Archer Ln;Elwood;IL;60421-6044
email;internet:steggy@bcstechnology.net
title:President & CEO
tel;work:(815) 423-5458
x-mozilla-html:TRUE
url:http://bcstechnology.net
version:2.1
end:vcard


--------------010900000108080202090902--

