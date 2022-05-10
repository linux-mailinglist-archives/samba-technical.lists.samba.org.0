Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC975221AA
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 18:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=L91w5stgUuGxNt3dOwzQcBn1fzVX4Z7+0g9TJD1apR0=; b=OZmOgJBAUGzbp/9D9zzBPdQVID
	8chAYS5u7BGf3zDenZ8MwQDxEj6SsN6uER+gCa31qwDnUi2JZgJQ0POTEfoXJuhROOeLDzlRupZ33
	x5T/Xv64fqwyeW9W6iatIvKJ5JGPvA4lBcikSEoBHxZyZ142n/aJfgQdgs5xUlK/R3MgWOKfhwJjM
	/QcNDl0vJkLpWM6BgstnBYdgfzIGB4JzfUcHmgxppjzjeOOHGr5TFU2h8xioDNchExzAplCTplAEQ
	Dn6JOgjjNcsGHcbo+btMjCkGsucE5sa8Riv1ujT9H3k1bg19tFlXE+0q14HUb7oV6e+xMZsGbkLC3
	WubK53WA==;
Received: from ip6-localhost ([::1]:56778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noT2a-000Ofe-Ph; Tue, 10 May 2022 16:48:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61452) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noT2V-000OfV-Sb
 for samba-technical@lists.samba.org; Tue, 10 May 2022 16:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=L91w5stgUuGxNt3dOwzQcBn1fzVX4Z7+0g9TJD1apR0=; b=tnKOIU0uTkhn50jhtjzzJm6W6/
 CfaqE3Y2IlQzh/T/glQvGmL9DokUZPZUcogu/ul1Qg3eNyXr4OYibnvMj9oQvpMsZPEWm+NsmOLwo
 PMwW77csuWQ3RC06rsFphNv1sd7NKQhFK/wMZ+SpJthtXa1xA6p3cMebi9s1Quwykeki4GKvEu9Cc
 bWw+im+n6AfFGvJha/lNBrZZJxr2uRZPr8u3I6A9xIDESOy/sydBVJ3rj/QwRR3ii4sr717D+XjQV
 V8F3H6gJ56CZ1hsRkSTB01lXtOCe6BncuPpQcTb5anTu6HsuBcbxeQy+xigWlVvxNj8debG8nVchD
 802IPrFz+uohapZ9ldeaD8y7o4WuvQyUKPcXB03nZFrS4jg2wc0vlUssyMDq8/DB4RTePFPHph4Rl
 7yBa07/JYDAyC1ZL4koSO6MG2oF39SQRuJXicdXF2vn2IKcJHSCUXXxPOOlRuzj/r0bCI0R2U8OeM
 rb+HY3GRCRzpNhMtQLhQJf+r;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noT2V-000ClW-6c; Tue, 10 May 2022 16:48:47 +0000
Message-ID: <2bf98ce9-8e76-6647-85c7-b0dfa217dc35@samba.org>
Date: Tue, 10 May 2022 18:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Thomas Nagy <tnagy@waf.io>,
 samba-technical <samba-technical@lists.samba.org>
References: <E1noCjW-0005xO-Fz@rmmprod05.runbox>
 <32a069f2-ecf5-ee08-ee80-30183e72e428@msgid.tls.msk.ru>
Subject: crash on debian i386 in krb5_plugin_register(hdb_samba4_interface)
 (Re: waf, PYTHONHASHSEED & -I order on other architectures)
In-Reply-To: <32a069f2-ecf5-ee08-ee80-30183e72e428@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Hi Michael,

> As I already wrote in another email, it is not "just" the link order.
> Well, it is, but sometimes it even produces an executable (or a library)
> which starts but crashes later.  We have such a broken build of samba in
> debian i386 stable right now.

Today I found a crash problem on i386 in:

         ret = krb5_plugin_register(kdc->smb_krb5_context->krb5_context,
                                    PLUGIN_TYPE_DATA, "hdb_samba4_interface",
                                    &hdb_samba4_interface);

This is because krb5_plugin_register => heim_plugin_register casts:

struct hdb_method {
     int                 version;
     unsigned int        is_file_based:1;
     unsigned int        can_taste:1;
     krb5_error_code     (*init)(krb5_context, void **);
     void                (*fini)(void *);
     const char *prefix;
     krb5_error_code (*create)(krb5_context, HDB **, const char *filename);
};

into:

struct heim_plugin_common_ftable_desc {
     int                 version;
     int                 (HEIM_LIB_CALL *init)(heim_pcontext, void **);
     void                (HEIM_LIB_CALL *fini)(void *);
};

This seems to work on x86_64 as we have 4 padding bytes after 'int version',
so that the 'init' function pointer is at offset 8.

But on i386 hdb_method has 'init' at offset 8 while
heim_plugin_common_ftable_desc has it at offset 4.

So is_file_based and can_tast need to move behind the 'fini' function
pointer.

Is that the crash you are seeing?

metze

