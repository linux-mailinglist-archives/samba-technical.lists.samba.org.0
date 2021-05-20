Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E8389E04
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 08:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:subject:cc;
	bh=rkTW56Nfd0sBytsKgqoibDaa+Hu9towZNDozkTNqLY0=; b=PSn9727w8t2arDTzm7T1t8Pcyn
	LXALb2UIBq4HN2hrQ4R5k+lutC83pira1OUlQ+g5NF0yhhfrTh2S9lqZjzSaChhV8Idw4bZYBJ+q1
	sYytpsldjTUibdHmZa93a1zV7YAD+fGhNSPo2iEC1O3swURA0QueiQJjjoPDpdmD8jRQ5qmnKLMTL
	hTj+2uyBLg/qxFe5A8QUbNw3tPouIiHrWXAZKra8dfCCIOWIknXOV+h5CUfslcxPP8xibBW3qGTua
	DOHniMHfmZBQSsB6grDe6Ps9BRFNg3Bnhx1WyloUqpe8bfKOAE6pajgOVn8GCyuGxpjLwilBbKMcB
	okFKzloA==;
Received: from ip6-localhost ([::1]:47060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljcIS-001wbn-Sk; Thu, 20 May 2021 06:36:40 +0000
Received: from mail.itsd.de ([80.153.216.99]:46273) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljcI4-001wbZ-OI
 for samba-technical@lists.samba.org; Thu, 20 May 2021 06:36:23 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS;
 Thu, 20 May 2021 08:36:12 +0200 (CEST)
Received: from nero.itsd.de (unknown [192.168.0.223])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id EBDF5800D6;
 Thu, 20 May 2021 08:36:11 +0200 (CEST)
subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
Organization: itsystems Deutschland AG
Message-ID: <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
Date: Thu, 20 May 2021 08:36:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=kHutuxp2W
 wV5/WBgEVsKArFquNmaOJxzUQqTaaXYJ3A=; b=hCn+RIfQogspLE3O3SVeeuGak
 66j1lNfHLXJ0FW36y+j/6ecun1O7XGSQ07zj9B9RWAlZKoKOtr0PeOaK6YvWqO2G
 a08Jvbllh8BPd4TnYeYE+/Bni7rNfRvg6yVpBkNFV+mWF4XHZKvhkfFxfshmGjus
 rEMVOhxgI8Yha13t4bB7dx9X6QdhXMkl9BzYffHdi1fEJNft868VzZ4TACJfLSB8
 xyh/PdjSxpkNCI9aUXhfqW6QxcHIe0wZbb1Rj38IFuMyNOTUuFbSjSROZrJ32zOr
 YMln+aKmVnp+LBzDtfe8pOR10pAf3SijFJw6j2ve+AWzCwzaarRFoByW4hg+Q==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 19.05.21 um 11:55 schrieb Andrew Bartlett:
> On Wed, 2021-05-19 at 07:56 +0200, Dr. Hansjörg Maurer wrote:
>>> OK, so this case it doesn't happen, which is the one I patched.
>> the gdb run took place with the unpatched version
>>
> Thanks, can you try with the patched one?  I'm thinking we must be
> hitting a different case now, if you still have issues, as the lines
> you show are gone with this patch (I hope).
Hi Andrew

here is the gdb bt output from the patched version

I patched the sources an rebuild the RPM with the spec file.
I would expect, this would apply the changes to the winbind.idl file?

Best regards

Hansjörg

(gdb)
talloc_get_size (context=0x555556872f90) at ../../lib/talloc/talloc.c:2821
2821    {
(gdb)
2824            if (context == NULL) {
(gdb)
2828            tc = talloc_chunk_from_ptr(context);
(gdb)
talloc_get_size (context=0x555556872f90) at ../../lib/talloc/talloc.c:2830
2830            return tc->size;
(gdb)
ndr_token_store (mem_ctx=mem_ctx@entry=0x5555558ce920, 
list=list@entry=0x5555558ce968,
     key=key@entry=0x7fffdccba018, value=31) at ../../librpc/ndr/ndr.c:994
994                     if (list->count >= NDR_TOKEN_MAX_LIST_SIZE) {
(gdb)
1017            return NDR_ERR_SUCCESS;
(gdb)
ndr_pull_array_size (ndr=ndr@entry=0x5555558ce920, 
p=p@entry=0x7fffdccba018) at ../../librpc/ndr/ndr.c:1090
1090            if (ret == NDR_ERR_RANGE) {
(gdb)
1091                    return ndr_pull_error(ndr, ret,
(gdb)
_ndr_pull_error (ndr=ndr@entry=0x5555558ce920, 
ndr_err=ndr_err@entry=NDR_ERR_RANGE,
     function=function@entry=0x7ffff7bcd650 <__FUNCTION__.9556> 
"ndr_pull_array_size",
     location=location@entry=0x7ffff7bcc431 "../../librpc/ndr/ndr.c:1093",
     format=format@entry=0x7ffff7bcce00 "More than %d NDR tokens stored 
for array_size")
     at ../../librpc/ndr/ndr.c:606
606     {
(gdb)
607             char *s=NULL;


(gdb) bt full
#0  _ndr_pull_error (ndr=ndr@entry=0x5555558ce920, 
ndr_err=ndr_err@entry=NDR_ERR_RANGE,
     function=function@entry=0x7ffff7bcd650 <__FUNCTION__.9556> 
"ndr_pull_array_size",
     location=location@entry=0x7ffff7bcc431 "../../librpc/ndr/ndr.c:1093",
     format=format@entry=0x7ffff7bcce00 "More than %d NDR tokens stored 
for array_size")
     at ../../librpc/ndr/ndr.c:607
         s = 0x7fffe065ec98 "w10_lgrm.rduser_ptid-l-201475_b"
         ap = {{gp_offset = 1, fp_offset = 0,
             overflow_arg_area = 0x7ffff47373fc 
<convert_string_talloc_handle+428>, reg_save_area = 0xff070}}
         ret = <optimized out>
         __FUNCTION__ = "_ndr_pull_error"
#1  0x00007ffff7bc6ee2 in ndr_pull_array_size 
(ndr=ndr@entry=0x5555558ce920, p=p@entry=0x7fffdccba018)
     at ../../librpc/ndr/ndr.c:1091
         ret = <optimized out>
         size = 31
         __FUNCTION__ = "ndr_pull_array_size"
#2  0x00007ffff504b40c in ndr_pull_wbint_Principal (ndr=0x5555558ce920, 
ndr_flags=<optimized out>,
     r=0x7fffdccb9fd0) at librpc/gen_ndr/ndr_winbind.c:420
         _status = <optimized out>
         size_name_0 = 0
         length_name_0 = 0
         __FUNCTION__ = "ndr_pull_wbint_Principal"
#3  0x00007ffff504b652 in ndr_pull_wbint_Principals (ndr=0x5555558ce920, 
ndr_flags=<optimized out>,
     r=0x55555591b1c0) at librpc/gen_ndr/ndr_winbind.c:488
         _status = <optimized out>
         size_principals_0 = <optimized out>
         cntr_principals_0 = <optimized out>
         _mem_save_principals_0 = 0x55555591b1c0
         __FUNCTION__ = "ndr_pull_wbint_Principals"
#4  0x00007ffff504d4eb in ndr_pull_wbint_QueryGroupList 
(ndr=0x5555558ce920, flags=<optimized out>,
     r=0x555555916780) at librpc/gen_ndr/ndr_winbind.c:1899
         _status = <optimized out>
         _mem_save_groups_0 = <optimized out>
         __FUNCTION__ = "ndr_pull_wbint_QueryGroupList"
#5  0x00007ffff735c44c in dcerpc_binding_handle_call_done 
(subreq=0x5555559171d0)
--Type <RET> for more, q to quit, c to continue without paging--c
     at ../../librpc/rpc/binding_handle.c:492
         req = 0x55555591b270
         state = 0x55555591b420
         h = 0x5555558f9cf0
         error = {v = 0}
         out_flags = 0
         ndr_err = <optimized out>
#6  0x00005555555e86d1 in wbint_bh_raw_call_domain_done 
(subreq=0x555555917860) at ../../source3/winbindd/winbindd_dual_ndr.c:204
         req = 0x55555591ba50
         state = 0x55555591bc00
         ret = 0
         err = 21845
#7  0x00005555555e6010 in wb_domain_request_done (subreq=0x555555917510) 
at ../../source3/winbindd/winbindd_dual.c:734
         req = 0x555555917860
         state = <optimized out>
         ret = 0
         err = 21845
#8  0x00005555555e4041 in wb_child_request_done (subreq=0x55555591cec0) 
at ../../source3/winbindd/winbindd_dual.c:298
         req = 0x555555917510
         state = <optimized out>
         ret = <optimized out>
         err = 21845
#9  0x00007ffff004648b in wb_simple_trans_read_done 
(subreq=0x55555591d550) at ../../nsswitch/wb_reqtrans.c:432
         req = 0x55555591cec0
         state = <optimized out>
         ret = 9226296
         err = 21845
#10 0x00007ffff0045cba in wb_resp_read_done (subreq=0x55555591d200) at 
../../nsswitch/wb_reqtrans.c:275
         req = 0x55555591d550
         state = 0x55555591d700
         buf = 0x7fffe0a93070 <error: Cannot access memory at address 
0x7fffe0a93070>
         err = 32767
#11 0x00007ffff713eb53 in tevent_common_invoke_fd_handler 
(fde=fde@entry=0x55555590d9e0, flags=<optimized out>, 
removed=removed@entry=0x0) at ../../lib/tevent/tevent_fd.c:138
         handler_ev = 0x5555558ad350
#12 0x00007ffff71450ef in epoll_event_loop (tvalp=0x7fffffffd510, 
epoll_ev=0x5555558c2f60) at ../../lib/tevent/tevent_epoll.c:736
         fde = 0x55555590d9e0
         flags = <optimized out>
         mpx_fde = <optimized out>
         ret = <optimized out>
         i = 0
         timeout = <optimized out>
         wait_errno = 4
         events = {{events = 1, data = {ptr = 0x55555590d9e0, fd = 
1435556320, u32 = 1435556320, u64 = 93824996137440}}}
         ret = <optimized out>
         i = <optimized out>
         events = <optimized out>
         timeout = <optimized out>
         wait_errno = <optimized out>
         fde = <optimized out>
         flags = <optimized out>
         mpx_fde = <optimized out>
         handled_fde = <optimized out>
         handled_mpx = <optimized out>
#13 epoll_event_loop_once (ev=<optimized out>, location=<optimized out>) 
at ../../lib/tevent/tevent_epoll.c:937
         epoll_ev = 0x5555558c2f60
         tval = {tv_sec = 0, tv_usec = 821479}
         panic_triggered = false
#14 0x00007ffff71430fb in std_event_loop_once (ev=0x5555558ad350, 
location=0x555555615828 "../../source3/winbindd/winbindd.c:1949") at 
../../lib/tevent/tevent_standard.c:110
         glue_ptr = <optimized out>
         glue = 0x5555558c2ed0
         ret = <optimized out>
#15 0x00007ffff713e225 in _tevent_loop_once (ev=0x5555558ad350, 
location=0x555555615828 "../../source3/winbindd/winbindd.c:1949") at 
../../lib/tevent/tevent.c:772
         ret = <optimized out>
         nesting_stack_ptr = 0x0
#16 0x000055555557f1a4 in main (argc=<optimized out>, argv=<optimized 
out>) at ../../source3/winbindd/winbindd.c:1949
         is_daemon = false
         Fork = false
         log_stdout = true
         no_process_group = true
         long_options = {{longName = 0x0, shortName = 0 '\000', argInfo 
= 4, arg = 0x7fffefbf3160 <poptHelpOptions>, val = 0, descrip = 
0x55555561337b "Help options:", argDescrip = 0x0}, {longName = 
0x555555613390 "stdout", shortName = 83 'S', argInfo = 0, arg = 0x0, val 
= 1003, descrip = 0x555555613389 "Log to stdout", argDescrip = 0x0}, 
{longName = 0x555555613397 "foreground", shortName = 70 'F', argInfo = 
0, arg = 0x0, val = 1001, descrip = 0x5555556133a2 "Daemon in foreground 
mode", argDescrip = 0x0}, {longName = 0x5555556133bc "no-process-group", 
shortName = 0 '\000', argInfo = 0, arg = 0x0, val = 1002, descrip = 
0x555555614e70 "Don't create a new process group", argDescrip = 0x0}, 
{longName = 0x555555658a7e "daemon", shortName = 68 'D', argInfo = 0, 
arg = 0x0, val = 1000, descrip = 0x5555556133cd "Become a daemon 
(default)", argDescrip = 0x0}, {longName = 0x5555556133e7 "interactive", 
shortName = 105 'i', argInfo = 0, arg = 0x0, val = 105, descrip = 
0x5555556133f3 "Interactive mode", argDescrip = 0x0}, {longName = 
0x555555613404 "no-caching", shortName = 110 'n', argInfo = 0, arg = 
0x0, val = 110, descrip = 0x55555561340f "Disable caching", argDescrip = 
0x0}, {longName = 0x0, shortName = 0 '\000', argInfo = 4, arg = 
0x7ffff4f38280 <popt_common_samba>, val = 0, descrip = 0x55555561341f 
"Common samba options:", argDescrip = 0x0}, {longName = 0x0, shortName = 
0 '\000', argInfo = 0, arg = 0x0, val = 0, descrip = 0x0, argDescrip = 0x0}}
         lp_sub = <optimized out>
         pc = <optimized out>
         opt = <optimized out>
         frame = 0x555555914790
         status = <optimized out>
         ok = <optimized out>
         __FUNCTION__ = "main"
         __func__ = "main"


>
> Thanks!
>
> Andrew Bartlett


-- 
Dr. Hansjörg Maurer
itsystems Deutschland AG
Erzgießereistr. 22
80335 München
Tel:   +49-89-52 04 68-41
Fax:   +49-89-52 04 68-59
E-Mail: hansjoerg.maurer@itsd.de
Web:    http://www.itsd.de


Amtsgericht München HRB 132146
USt-IdNr. DE 812991301
Steuer-Nr. 143/100/81575

Aufsichtsratsvorsitzender:
Stefan Adam
Vorstand:
Dr. Michael Krocka
Dr. Hansjörg Maurer


