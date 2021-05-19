Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 244CC388C48
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 13:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Z191nSa+PjSSI+9UamtQgHhWCamjE4E5+SmtK9wnPW4=; b=TiDk3+QEMFb6pdpeYm6gDVeM8G
	QxyXuKbU6UXRBhdYqXUlTlAPWQPMuIR1iavvgSpTUkT6X7qfXrMFcsyoSKPu+IHQ1uZGFN1D6js1l
	Rjbg427ijFOjvKsoy25udRZfES7Lu0S/IHjsBc14BWnitHsGbtOgdXU+482rUXsFoUwLl9TF2IVJm
	XeYcmAHrdLtkQzncKrXgIkeBtw7J4YZH+21WJLAc50qSqI4JHkjl5xlRLVDk3+Tw+emuVyuj32fs6
	GUgrQobhTJTUk/labKLSfo99KFvx4tG0RufrKywTFuWCbtEPzBIZvzIzOfq2vk84iibjR34mtAQW/
	fp1k0CAg==;
Received: from ip6-localhost ([::1]:30846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljJyQ-001lhR-3z; Wed, 19 May 2021 11:02:46 +0000
Received: from air.basealt.ru ([194.107.17.39]:39062) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ljJyK-001lhI-3q
 for samba-technical@lists.samba.org; Wed, 19 May 2021 11:02:43 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id 87AFC58951E; Wed, 19 May 2021 11:02:32 +0000 (UTC)
Received: from [10.64.129.4] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id 5A037589438
 for <samba-technical@lists.samba.org>; Wed, 19 May 2021 11:02:30 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Question about registry operating functions
Organization: BaseALT
Message-ID: <c2a2a31b-0b62-5f5b-342d-38d059e35bba@basealt.ru>
Date: Wed, 19 May 2021 15:02:29 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

I want to link against `source3/registry/reg_objects.c` but keep getting 
errors like:

```
[4336/4410] Compiling source3/registry/reg_objects.c
../../source3/registry/reg_objects.c:38:2: error: unknown type name 
‘fstring’
   fstring  valuename;
   ^~~~~~~
../../source3/registry/reg_objects.c: In function 
‘regsubkey_ctr_key_exists’:
../../source3/registry/reg_objects.c:287:10: error: ‘False’ undeclared 
(first use in this function); did you mean ‘false’?
    return False;
           ^~~~~
           false
../../source3/registry/reg_objects.c:287:10: note: each undeclared 
identifier is reported only once for each function it appears in
../../source3/registry/reg_objects.c: In function ‘regval_name’:
../../source3/registry/reg_objects.c:370:12: error: returning ‘int’ from 
a function with return type ‘char *’ makes pointer from integer without 
a cast [-Werror=int-conversion]
   return val->valuename;
          ~~~^~~~~~~~~~~
../../source3/registry/reg_objects.c: In function ‘regval_ctr_value_exists’:
../../source3/registry/reg_objects.c:404:32: error: passing argument 1 
of ‘strequal’ makes pointer from integer without a cast 
[-Werror=int-conversion]
    if ( strequal( ctr->values[i]->valuename, value) )
                   ~~~~~~~~~~~~~~^~~~~~~~~~~
In file included from ../../source4/include/includes.h:62,
                  from ../../source3/registry/reg_objects.c:23:
../../source3/../lib/util/samba_util.h:343:36: note: expected ‘const 
char *’ but argument is of type ‘int’
  _PUBLIC_ bool strequal(const char *s1, const char *s2);
                         ~~~~~~~~~~~~^~
../../source3/registry/reg_objects.c:405:11: error: ‘True’ undeclared 
(first use in this function); did you mean ‘true’?
     return True;
            ^~~~
            true
../../source3/registry/reg_objects.c:408:9: error: ‘False’ undeclared 
(first use in this function); did you mean ‘false’?
   return False;
          ^~~~~
          false
../../source3/registry/reg_objects.c: In function ‘regval_ctr_value_byname’:
../../source3/registry/reg_objects.c:420:30: error: passing argument 1 
of ‘strequal’ makes pointer from integer without a cast 
[-Werror=int-conversion]
    if (strequal(ctr->values[i]->valuename, value)) {
                 ~~~~~~~~~~~~~~^~~~~~~~~~~
In file included from ../../source4/include/includes.h:62,
                  from ../../source3/registry/reg_objects.c:23:
../../source3/../lib/util/samba_util.h:343:36: note: expected ‘const 
char *’ but argument is of type ‘int’
  _PUBLIC_ bool strequal(const char *s1, const char *s2);
                         ~~~~~~~~~~~~^~
In file included from ../../source3/registry/reg_objects.c:30:
../../source3/registry/reg_objects.c: In function ‘regval_compose’:
../../lib/util/string_wrappers.h:40:54: error: ‘fstring’ undeclared 
(first use in this function); did you mean ‘isprint’?
   strlcpy((d),_fstrcpy_src ? _fstrcpy_src : "",sizeof(fstring)); \
                                                       ^~~~~~~
../../source3/registry/reg_objects.c:443:2: note: in expansion of macro 
‘fstrcpy’
   fstrcpy(regval->valuename, name);
   ^~~~~~~
../../source3/registry/reg_objects.c:443:16: error: passing argument 1 
of ‘strlcpy’ makes pointer from integer without a cast 
[-Werror=int-conversion]
   fstrcpy(regval->valuename, name);
../../lib/util/string_wrappers.h:40:11: note: in definition of macro 
‘fstrcpy’
   strlcpy((d),_fstrcpy_src ? _fstrcpy_src : "",sizeof(fstring)); \
            ^
In file included from ../../lib/replace/../replace/replace.h:176,
                  from ../../source4/include/includes.h:23,
                  from ../../source3/registry/reg_objects.c:23:
/usr/include/string.h:466:41: note: expected ‘char * restrict’ but 
argument is of type ‘int’
  extern size_t strlcpy (char *__restrict __dest,
                         ~~~~~~~~~~~~~~~~~^~~~~~
```

Could anyone possibly point me to the way to build reg_objects.c 
successfully so I will be able to link against it? Maybe I need to add 
some target?

-- 
With best regards, Igor Chudov
Lead engineer
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34

