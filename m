Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6016DF286
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 13:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3NI0hi/ojVSr25JJk0wMm9MwhDtboQpy9kEwp8uYVYQ=; b=blL3ImhdmyD9wlGGbpj6i3TNYH
	qcaK9uYcYRX6aMmuC7k2R0AvhunVxMoFX2/HSDWBQRYU2/fNkvWzZyIFUFtb5SKgTJUC38AEeXRqD
	fzIJF8XN58AaGgSIbpdplmVe2RjWBHJhn8olElQ/5i5QZEDTPl3ntzwyStOf9oMpD8mhqcfhjQprW
	4ScFGNwYyocnCcO4LjhhTf8rJFRdm/1WfUDsX4GeIoXtQ8zSk7rjqXkILI+IGyJAEaLgNDc5LdLUP
	fR8cWtzAWppdCm6PAHI6x5sl0PDeDaZAn/kHpwMcjG4G1XdnjLTP2g3ZekZyyd9JYS4AfVyaZTydO
	pAMBgtuQ==;
Received: from ip6-localhost ([::1]:48088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmYJK-000f9l-Ph; Wed, 12 Apr 2023 11:06:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmYJG-000f9c-NP
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 11:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3NI0hi/ojVSr25JJk0wMm9MwhDtboQpy9kEwp8uYVYQ=; b=j4AIBySUu4wcR6jnAVgO6Tkbqe
 aXJfdtjrZo73dwSrh9ibzlKlsBAnteA3zBr4zrT6jjlenMc7acq7toTAzKXkDI8omHt2pJGEmKhPc
 iwVK1BUnhinqtPh2jCPmbDZCxe9TjQvHrahDX3tct42UEavt8qGQqV3DvcPjTXPezFBLm7Yjhge8j
 G4CWm0ZZE8uWIFfeILrP4eofp1QxtAYxM7FsnWRNM8Uk5BPXHacT28uIe3zzgrCQqHSRpu5crxItS
 H7HafWevEDfzy1jCU6SkQB6pke9S1qJBYxOTRHpZBqzQZlhZiEA5vo0VS52WRHICvtfma6yClKSl7
 waM9vdPRxVj69tczjOLMTvwtTDr9FrelQJYxSNKsPCrHjm3njWjKneG+JirROPzmjXCh4SlbPNjgx
 +irJ8pYuvM8lTLisYP3l7pqTHiUYwYGt4EnT+bQiNZbg9HGcVln5d+i4CAYF8L5FrvSOaIGN9jyzn
 kKSImRX0EExm1ZveVbJIZmNR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmYJF-000gro-Th
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 11:06:42 +0000
Message-ID: <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
Date: Wed, 12 Apr 2023 12:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Content-Language: en-GB
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
 <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
 <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
To: samba-technical@lists.samba.org
In-Reply-To: <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 12/04/2023 11:39, Jan Andersen wrote:
> Hi Rowland,
> 
> Thank you for replying. I wiped the existing logs, changed the smbd 
> service to include '-d 10' and restarted, so I would have logs without 
> too much noise - please find them attached along with smb.conf
> 
>

You appear to be running Samba as a standalone server with an ldap 
backend, are you aware that such a setup is two parameters away from 
being a PDC ? If you comment out 'server role = standalone server' and 
add 'domain logons = yes', it becomes a PDC and a PDC (from 4.8.0) 
requires winbind to be running.

Rowland


