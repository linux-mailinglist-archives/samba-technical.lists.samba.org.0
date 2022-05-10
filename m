Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E35223C6
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 20:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1yImjvpq0IYc8sZpU8rN94MrSj0g0QJHnjOoets5+c8=; b=NUT5WUhUqWQxsxY2DSSaYBDuPA
	K2vVPYOqE2Ipv1UP8OFqp1xvL6qjxWPoccBQVtUCYV0amjenuftmn/K9t4ESh7Ttmu8v+dN31O4au
	yxO8IXGtei+lnYW0Z22PgI+Ak02c0Q7ycWCWCK6ucUtnOslERNVMzAEXbUZ1Cd5W+mLhrbk6X0oGi
	++7Dm3pu4M49p/LwVnOX2FcQS1LLi/sOFlJBGBgVLrG6YwKc74iIH3gFpusI3PvPrXZRu/8gbp8L6
	Y6tPL2NhpCtZRXdpCxWP3DwhVuI8Y4kB8d0N3FpJos2zJO9NV2csWeIcvL6PhM+XRa1luBTyfjmgt
	waIbk8ZA==;
Received: from ip6-localhost ([::1]:62328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noURn-000R7J-3d; Tue, 10 May 2022 18:18:59 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51615) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noURh-000R79-Tt
 for samba-technical@lists.samba.org; Tue, 10 May 2022 18:18:56 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A204C407D4;
 Tue, 10 May 2022 21:18:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 4F80213A;
 Tue, 10 May 2022 21:18:50 +0300 (MSK)
Message-ID: <0dabb153-a712-06de-add5-4efc963c3b98@msgid.tls.msk.ru>
Date: Tue, 10 May 2022 21:18:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: crash on debian i386 in
 krb5_plugin_register(hdb_samba4_interface) (Re: waf, PYTHONHASHSEED & -I
 order on other architectures)
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <E1noCjW-0005xO-Fz@rmmprod05.runbox>
 <32a069f2-ecf5-ee08-ee80-30183e72e428@msgid.tls.msk.ru>
 <2bf98ce9-8e76-6647-85c7-b0dfa217dc35@samba.org>
In-Reply-To: <2bf98ce9-8e76-6647-85c7-b0dfa217dc35@samba.org>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

10.05.2022 19:48, Stefan Metzmacher via samba-technical wrote:
> 
> Hi Michael,
> 
>> As I already wrote in another email, it is not "just" the link order.
>> Well, it is, but sometimes it even produces an executable (or a library)
>> which starts but crashes later.  We have such a broken build of samba in
>> debian i386 stable right now.
> 
> Today I found a crash problem on i386 in:
> 
>          ret = krb5_plugin_register(kdc->smb_krb5_context->krb5_context,
>                                     PLUGIN_TYPE_DATA, "hdb_samba4_interface",
>                                     &hdb_samba4_interface);
> 
> This is because krb5_plugin_register => heim_plugin_register casts:
> 
> struct hdb_method {
>      int                 version;
>      unsigned int        is_file_based:1;
>      unsigned int        can_taste:1;
>      krb5_error_code     (*init)(krb5_context, void **);
>      void                (*fini)(void *);
>      const char *prefix;
>      krb5_error_code (*create)(krb5_context, HDB **, const char *filename);
> };
> 
> into:
> 
> struct heim_plugin_common_ftable_desc {
>      int                 version;
>      int                 (HEIM_LIB_CALL *init)(heim_pcontext, void **);
>      void                (HEIM_LIB_CALL *fini)(void *);
> };

Oh lovely :)

Well, that definitely is not the right thing to cast one to another :)

> This seems to work on x86_64 as we have 4 padding bytes after 'int version',
> so that the 'init' function pointer is at offset 8.
> 
> But on i386 hdb_method has 'init' at offset 8 while
> heim_plugin_common_ftable_desc has it at offset 4.
> 
> So is_file_based and can_tast need to move behind the 'fini' function
> pointer.
> 
> Is that the crash you are seeing?

No. Because the crash we're seeing comes from the *order* of
the link of some of the libraries.  Yes, that's right, the
*order* in which you link things matter.  I weren't able to
reproduce the crash up until I learned about this PYTHONHASHSEED
thing and tried to do the link in the same *order* as seen in
the debian build log. Before that, we didn't set PYTHONHASHSEED
at all and the order was random.  smbd crashed at startup
regardless of krb5 stuff.

I didn't try to investigate further as it is pointless now, -
since the thing depend on particular "random" order, since
the affected version is old (4.13) and new one is already
available and since whole thing - "random" order of everything -
is what must be addressed, instead of finding which "random"
is sufficiently random to give the wrong results.  I just
did quite some ad-hoc grep/sed stuff to extract the link
lines and repeated the build, the result crashed.

https://bugs.debian.org/1009855 is the bug report in question.
https://bugs.debian.org/1006935 is of the same theme.

Neither of which is krb5-related.

But this krb5 thing is.. lovely :)

Thank you for sharing!

/mjt

